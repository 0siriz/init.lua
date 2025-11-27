return {
  {
    'j-hui/fidget.nvim',
    tag = 'v1.6.1',
    event = { 'VeryLazy' },
    opts = {
      notification = {
        view = {
          group_separator_hl = 'FidgetGroupSeparator'
        },
        window = {
          normal_hl = 'FidgetNormal'
        },
        override_vim_notify = true,
        configs = {
          default = {
            name = 'Notifications',
            icon = '❰❰',
            ttl = 5,
            group_style = 'FidgetGroup',
            icon_style = 'FidgetIcon',
            annote_style = 'FidgetAnnote',
            debug_style = 'FidgetDebug',
            info_style = 'FidgetInfo',
            warn_style = 'FidgetWarn',
            error_style = 'FidgetError',
            debug_annote = 'DEBUG',
            info_annote = 'INFO',
            warn_annote = 'WARN',
            error_annote = 'ERROR',
            update_hook = function(item)
              require('fidget.notification').set_content_key(item)
            end
          },
          mason = {
            name = 'Mason',
            icon = ' ',
            ttl = 5,
            group_style = 'FidgetGroup',
            icon_style = 'FidgetIcon',
            annote_style = 'FidgetAnnote',
            debug_style = 'FidgetDebug',
            info_style = 'FidgetInfo',
            warn_style = 'FidgetWarn',
            error_style = 'FidgetError',
            debug_annote = 'DEBUG',
            info_annote = 'INFO',
            warn_annote = 'WARN',
            error_annote = 'ERROR',
            update_hook = function(item)
              require('fidget.notification').set_content_key(item)
            end
          }
        }
      },
    },
  },
}
