require 'sinatra'
require 'kss'

get '/' do
  erb :index
end

get '/media' do
  @styleguide = Kss::Parser.new('public/stylesheets')
  erb :styleguide
end

get '/font' do
  @sizes = [['1.1.1', 'f-xxs'], ['1.1.2', 'f-xs'], ['1.1.3', 'f-s'], ['1.1.4', 'f-m'], ['1.1.5', 'f-l'], ['1.1.6', 'f-xl'], ['1.1.7', 'f-xxl']]
  @styles = [['1.2.1', 'f-b'], ['1.2.2', 'f-i'], ['1.2.3', 'f-u']]
  @styleguide = Kss::Parser.new('public/stylesheets')
  erb :font
end

get '/layout' do
  @grids = []
  #@down_shifts = [['2.1.1', 'l-dwn-xs'], ['2.1.2', 'l-dwn-s'], ['2.1.3', 'l-dwn-m'], ['2.1.4', 'l-dwn-l'], ['2.1.5', 'l-dwn-xl'], ['2.1.6', 'l-dwn-xxl']]
  #@right_shifts = [['2.1.7', 'l-rgt-xs'], ['2.1.8', 'l-rgt-s'], ['2.1.9', 'l-rgt-m'], ['2.1.10', 'l-rgt-l'], ['2.1.11', 'l-rgt-xl'], ['2.1.12', 'l-rgt-xxl']]
  @styleguide = Kss::Parser.new('public/stylesheets')
  erb :layouts
end

get '/list' do
  @styleguide = Kss::Parser.new('public/stylesheets')
  erb :list
end

get '/skin' do
  @styleguide = Kss::Parser.new('public/stylesheets')
  erb :skin
end

helpers do
  # Generates a styleguide block. A little bit evil with @_out_buf, but
  # if you're using something like Rails, you can write a much cleaner helper
  # very easily.
  def styleguide_block(section, &block)
    @section = @styleguide.section(section)
    @test = block.inspect
    @example_html = capture{ block.call }
    @_out_buf << erb(:_styleguide_block)
  end

  # Captures the result of a block within an erb template without spitting it
  # to the output buffer.
  def capture(&block)
    out, @_out_buf = @_out_buf, ""
    yield
    @_out_buf
  ensure
    @_out_buf = out
  end
end