module.exports = class ContactRow extends Mn.ItemView

    template: require 'views/templates/contacts/row'

    tagName: 'li'

    attributes:
        role: 'row'


    modelEvents:
        'change': 'render'
        'sync':   'render'


    serializeData: ->
        app        = require 'application'
        filter     = app.model.get('filter')?.match /`text:([\w\s]+)`/i
        formatOpts =
            pre: '<b>'
            post: '</b>'

        if filter
            match = @model.match filter[1],
                pre: '<span class="search">'
                post: '</span>'
                format: formatOpts
            fullname = match.rendered
        else
            fullname = @model.toString formatOpts

        _.extend {}, super(), fullname: fullname
