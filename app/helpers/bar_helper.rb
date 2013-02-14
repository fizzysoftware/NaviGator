module BarHelper

  def message_for_bar( _bar )
    _bar.message.present? ? _bar.message : 'Hello type your message below'
  end

  def link_text_for_bar( _bar )
    _bar.link.present? ? _bar.link : 'Try it out'
  end

  def link_url_for_bar( _bar )
    _bar.link_url.present? ? "//#{ _bar.link_url }" : '#'
  end

  def target_value_for_bar( _bar )
    _bar.link_url.present? ? '_blank' : ''
  end

  def link_to_for_bar( _bar )
    link_to link_text_for_bar( @bar ), link_url_for_bar( _bar ), :class => "message_link", target: target_value_for_bar( _bar)
  end

end