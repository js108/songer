###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Pretty urls - makes folders out of file names in build 
# test.html.erb becomes test/index.html 
activate :directory_indexes

#Dato online cms thingy
activate :dato, token: '7c4e142de73b36220cfa'

ignore "/service.html"
dato.services.each do |b| 
  proxy "/services/#{b.title.parameterize}/index.html", "/service.html", locals: { service: b }
end

ignore "/paper.html"
dato.papers.each do |b| 
  proxy "/papers/#{b.title.parameterize}/index.html", "/paper.html", locals: { paper: b }
end

ignore "/paper-full.html"
dato.papers.each do |b| 
  proxy "/papers-full/#{b.title.parameterize}/index.html", "/paper-full.html", locals: { paper: b }
end

ignore "/newsletter.html"
dato.newsletters.each do |b| 
  proxy "/newsletters/#{b.title.parameterize}/index.html", "/newsletter.html", locals: { newsletter: b }
end

#specify layout for home page
page "/index.html", :layout => "home"

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

helpers do
  def markdownify(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, footnotes: true, superscript: true)
	markdown.render(text)
  end
end




# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
