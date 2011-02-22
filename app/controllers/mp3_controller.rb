class Mp3Controller < ContentController
  # SEE:http://www.techskater.com/ruby-on-rails/rails-engines-and-the-a-copy-of-applicationcontroller-has-been-removed-from-the-module-tree-but-is-still-active-error/
  unloadable

  def onebit
    src = "#{RAILS_ROOT}/vendor/plugins/typo_mp3_sidebar/public/1bit/#{params[:filename]}"
    mime = mime_for(params[:filename])
    send_file(src, :type => mime, :disposition => 'inline', :stream => true)
  end

  private
  def mime_for(filename)
    case filename.downcase
    when /\.js$/
      'text/javascript'
    when /\.css$/
      'text/css'
    when /\.gif$/
      'image/gif'
    when /(\.jpg|\.jpeg)$/
      'image/jpeg'
    when /\.png$/
      'image/png'
    when /\.swf$/
      'application/x-shockwave-flash'
    else
      'application/binary'
    end
  end
end

