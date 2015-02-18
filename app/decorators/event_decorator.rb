class EventDecorator < ApplicationDecorator
  include Draper::LazyHelpers

  delegate :name

  def occurred_at
    fa_icon 'calendar', text: l(object.occurred_at, format: '%a %d/%m/%Y %H:%M')
  end

  def local
    link_to "https://www.google.com.br/maps/search/#{object.address}", target: '_blank' do
      concat(fa_icon 'map-marker', text: object.local)
    end
  end

  def description
    render_markdown object.description
  end

  def details_link
    link_to t('events.banner.more_details'), object, class: 'btn btn-success'
  end
end
