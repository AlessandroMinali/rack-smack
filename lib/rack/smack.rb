module Rack
  # don't cross me boy
  class Smack
    ASSET    = %w[css gif jpg jpeg js png ico txt].freeze
    BLOCKED  = %w[wp wordpress xmlrpc sfn].freeze
    FILENAME = './ban_list.txt'.freeze

    def initialize(app, opts = {})
      @app     = app
      @asset   = opts.delete(:asset) || ASSET
      @blocked = opts.delete(:list)  || BLOCKED
      @file    = opts.delete(:file)  || FILENAME
      @anon    = opts.delete(:anon)  || false
      raise TypeError        unless options_valid?
      IO.write(FILENAME, '') unless ::File.file?(@file)

      if @anon
        define_singleton_method(:ip) { Digest::SHA2.hexdigest(@req.ip)[0...16] }
      end
    end

    def call(env)
      @req = Rack::Request.new(env)
      return @app.call(env) if @asset.include? @req.path.split('.')[-1]
      return smack          if banned?
      return ban!           if @blocked.any? { |block| @req.path =~ /\.#{block}$/i }
      @app.call(env)
    end

    private

    def ban!
      IO.write(@file, "#{ip},#{@req.path},#{Time.now}\n", mode: 'a')
      smack
    end

    def banned?
      IO.foreach(@file) do |row|
        return true if row.split(',')[0] == ip
      end
      false
    end

    def options_valid?
      @blocked.is_a?(Array) && @asset.is_a?(Array) && @file.is_a?(String)
    end

    def smack
      [403, { 'Content-Type' => 'text/html' }, ['Banned.']]
    end

    def ip
      @req.ip
    end
  end
end
