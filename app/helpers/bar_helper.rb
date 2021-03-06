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
    link_to link_text_for_bar( @bar ), link_url_for_bar( _bar ),
      class: 'message_link',
      target: target_value_for_bar( _bar),
      style: "color: #{ bar_link_text_color( _bar ) }; background: #{ bar_link_bg_color( _bar ) }"
  end

  def bar_bg_color( _bar )
    _bar.bg_color.present? ? _bar.bg_color : '#eb583c'
  end

  def bar_text_color( _bar )
    _bar.link_text_color.present? ? _bar.text_color : '#fff'
  end

  def bar_link_bg_color( _bar )
    _bar.bg_color.present? ? _bar.link_bg_color : '#3d3d3d'
  end

  def bar_link_text_color( _bar )
    _bar.link_text_color.present? ? _bar.link_text_color : '#fff'
  end

  def link_to_for_visibility( _bar, _state )
    _value = ( _state == 'on' ? 1 : 0 )
    link_to _state,
            visibility_user_bar_path( @user, _bar, bar: { active: _value } ),
            class: 'btn',
            remote: true,
            method: :put,
            onclick: 'visibilityChanged( this)',
            disabled: should_disabled?( _bar, _state )
  end

  def should_disabled?( _bar, _state )
    ( _state == 'on' && _bar.active?) || ( _state == 'off' && !_bar.active? )
  end

end
