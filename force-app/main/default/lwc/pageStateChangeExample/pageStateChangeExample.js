import { LightningElement, wire } from 'lwc';
import { CurrentPageReference, NavigationMixin } from 'lightning/navigation';

export default class PageStateChangeExample extends NavigationMixin(LightningElement) {
    currentPageReference;
    @wire(CurrentPageReference)
    setCurrentPageReference(currentPageReference){
        this.currentPageReference = currentPageReference;

        if (this.connected) {
            this.generateUrls();
        }else {
            this.generateUrlOnConnected = true;
        }
    }

    showPanelUrl;
    noPanelUrl;
    get showPanel() {
        return this.currentPageReference &&
            this.currentPageReference.state.c__showPanel == 'true';
    }

    generateUrls() {
        this[NavigationMixin.GenerateUrl](this.showPanelPageReference)
            .then(url => this.showPanelUrl = url);
        this[NavigationMixin.GenerateUrl](this.noPanelPageReference)
            .then(url => this.noPanelUrl = url);
    }

    get showPanelPageReference() {
        return this.getUpdatedPageReference({
            c__showPanel: 'true'
        });
    }
    get noPanelPageReference() {
        return this.getUpdatedPageReference({
            c__showPanel: undefined
        });
    }

    getUpdatedPageReference(stateChanges) {
        return Object.assign({}, this.currentPageReference, {
            state: Object.assign({}, this.currentPageReference.state, stateChanges)
        });
    }

    connectedCallback() {
        this.connected = true;
        if (this.generateUrlOnConnected) {
            this.generateUrls();
        }
    }

    handleShowPanelClick(evt) {
        evt.preventDefault();
        evt.stopPropagation();
        this[NavigationMixin.Navigate](this.showPanelPageReference, true);
    }
    handleNoPanelClick(evt) {
        evt.preventDefault();
        evt.stopPropagation();
        this[NavigationMixin.Navigate](this.noPanelPageReference, true);
    }
}