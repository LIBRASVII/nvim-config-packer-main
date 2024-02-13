local bufferline = require('bufferline')

bufferline.setup ({
    options = {
        mode = "buffers",
        -- style_preset = bufferline.style_preset.default,
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        color_icons = true, -- whether or not to add the filetype icon highlights
        get_element_icon = function(element)
        local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
        return icon, hl
      end,
        show_buffer_icons = true, -- disable filetype icons for buffers
        separator_style = "slope",
    }
})
