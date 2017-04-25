dmc-endpoints.EndpointsPage
  .EndpointsPage__list
    .EndpointsPage__addCard(click="{handleEndpointAdd}")
      dmc-icon(type="plus")
    virtual(each="{ item, url in endpoint }")
      dmc-endpoint(host="{ url }" title="{ item.title }" description="{ item.description }" tags="{ item.tags }" onentry="{ handleEndpointEntry }" onedit="{ handleEndpointEdit }" onremove="{ handleEndpointRemove }")

  script.
    import constants from '../../core/constants';
    import '../organisms/dmc-endpoint.tag';
    import '../atoms/dmc-icon.tag';

    const store = this.riotx.get();
    this.endpoint = {};
    store.change(constants.CHANGE_ENDPOINT, (err, state, store) => {
      this.endpoint = state.endpoint;
      this.update()
    })

    handleEndpointAdd() {
      alert('作成 -> ログイン -> endpoint一覧に追加する');
    }

    handleEndpointEntry(url) {
      Promise
        .resolve()
        .then(() => store.action(constants.ACTION_CURRENT_UPDATE, url))
        .catch((err) => {
          // TODO
        })
      ;
    }

    handleEndpointEdit(url) {
      throw new Error("TODO not support ... :P ");
    }

    handleEndpointRemove(url) {
      Promise
        .resolve()
        .then(() => store.action(constants.ACTION_ENDPOINT_REMOVE, url))
        .catch((err) => {
          // TODO
        })
      ;
    }
