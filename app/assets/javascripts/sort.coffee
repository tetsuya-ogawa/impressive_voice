$ ->
  $('.table-sortable').sortable
    axis: 'y'
    items: '.item'

    update: (e, ui) ->
      item = ui.item
      console.log(item)
      item_data = item.data()
      console.log(item_data)
      params = { _method: 'put' }
      params[item_data.modelName] = { order_position: item.index(), name: item.context.innerText }
      console.log(params)
      $.ajax
        type: 'POST'
        url: item_data.updateUrl
        dataType: 'json'
        data: params