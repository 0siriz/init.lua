return {
  {
    'j-hui/fidget.nvim',
    tag = 'v1.6.0',
    event = { 'VeryLazy' },
    opts = {
      notification = {
        override_vim_notify = true,
        configs = {
          mason = {
            name = 'Mason',
            icon = ' ',
            ttl = 5,
            group_style = 'Title',
            icon_style = 'Special',
            group_style = 'Title',
            icon_style = 'Special',
            annote_style = 'Question',
            debug_style = 'Comment',
            info_style = 'Question',
            warn_style = 'WarningMsg',
            error_style = 'ErrorMsg',
            debug_annote = 'DEBUG',
            info_annote = 'INFO',
            warn_annote = 'WARN',
            error_annote = 'ERROR',
            update_hook = function(item)
              require('fidget.notification').set_content_key(item)
            end,
          }
        }
      },
    },
  },
}
