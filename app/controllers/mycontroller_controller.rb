class MycontrollerController < ApplicationController

  def fast
    render :text => Time.now
  end

  def slow
    # render :text => HTTP.get('http://jjb.cc/').size
    sleep 5
    render :text => Time.now
  end
end
