class AboutController < ApplicationController
  def index
    @press_blurbs = PressBlurb.all.featured_in_about
    @sponsors = Sponsor.all.featured_in_about
  end
end
