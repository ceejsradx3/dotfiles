/** @babel */
/** @jsx etch.dom */

const { CompositeDisposable, TextEditor } = require("atom");
const marked = require("marked");
const etch = require("etch");

let oldView;

function markedCache(md) {
	// eslint-disable-next-line eqeqeq
	md = (md == null ? "" : String(md));

	if (!this.cache) {
		this.cache = {};
	}

	if (!this.cache[md]) {
		this.cache[md] = marked(md).trim();
	}

	return this.cache[md];
}

const defaults = {
	title: "",
	description: "",
	placeholder: "",
	value: "",
};

module.exports = class InputView {
	constructor(props = {}) {
		if (oldView) {
			oldView.destroy();
		}
		oldView = this;

		this.props = { ...defaults, ...props };

		etch.initialize(this);

		this.renderPromise = Promise.resolve();

		this.element.addEventListener("focusout", (e) => this.didChangeFocus(e));

		this.editor = this.refs.editor;
		if (this.props.value) {
			this.editor.setText(this.props.value);
			this.editor.selectAll();
		}

		this.panel = atom.workspace.addModalPanel({ item: this, autoFocus: true });

		const editorElement = atom.views.getView(this.editor);
		this.disposables = new CompositeDisposable();
		this.disposables.add(
			this.editor.onDidStopChanging(() => this.didChangeValue()),
			atom.commands.add(editorElement, "core:cancel", () => this.destroy()),
			atom.commands.add(editorElement, "core:confirm", () => this.confirm()),
			this.panel.onDidChangeVisible(visible => this.didChangeVisibility(visible)),
		);

		this.panel.show();
		editorElement.focus();

		this.promise = new Promise((resolve, reject) => {
			this.resolve = resolve;
			this.reject = reject;
		});
	}

	didChangeFocus(e) {
		if (e.relatedTarget && !this.element.contains(e.relatedTarget)) {
			this.destroy();
		}
	}

	didChangeVisibility(visible) {
		if (!visible) {
			this.destroy();
		}
	}

	didChangeValue() {
		this.props.value = this.editor.getText();
	}

	update(props = {}) {
		this.props = { ...this.props, ...props };

		this.renderPromise = etch.update(this).then(() => {
			if ("value" in props) {
				this.editor.setText(props.value);
			}
		});
		return this.renderPromise;
	}

	render() {
		const description = markedCache(this.props.description);
		return (
			<div className='input-view' tabIndex='-1'>
				{this.props.title
					? <h1 className='input-view-title'>{this.props.title}</h1>
					: null
				}
				{description
					? <div className='input-view-description' innerHTML={description} />
					: null
				}
				<TextEditor ref='editor' mini={true} placeholderText={this.props.placeholder} tabIndex='0' />
			</div>
		);
	}

	getInput() {
		return this.promise.catch((ex) => {
			if (ex) {
				return Promise.reject(ex);
			}
		});
	}

	async destroy() {
		this.disposables.dispose();
		await etch.destroy(this);
		this.panel.destroy();
		this.reject();
	}

	async confirm() {
		this.didChangeValue();
		const value = this.props.value;
		this.resolve(value);
		await this.destroy();
	}
};
