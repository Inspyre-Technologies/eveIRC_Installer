module Styler
  
  def styles
    {
      styles: {
        success: {
          symbol:   '✓ ',
          label:    'Success!',
          levelpad: 3,
          color:    'green'
        },
        fatal:   {
          symbol: ':( ',
          label:  'Fatal Error!'
        },
        info:    {
          symbol:   'Ⓘ ',
          label:    'Info',
          levelpad: 7,
          color:    'blue'
        },
        wait:    {
          symbol:   '⏲ ',
          label:    'Waiting...',
          levelpad: 1,
          color:    'yellow'
        }
      }
    }
  end
end