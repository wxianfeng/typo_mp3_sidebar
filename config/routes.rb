ActionController::Routing::Routes.draw do |map|
  %w{mp3}.each do |i|
    map.connect "#{i}", :controller => "#{i}", :action => 'index'
    map.connect "#{i}/:action", :controller => "#{i}"
    map.connect "#{i}/:action/:id", :controller => i, :id => nil
  end

  map.connect 'onebit/mp3/:filename',:controller=>"mp3" ,  :action => 'onebit' , :filename => /.*/
end