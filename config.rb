activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end
activate :directory_indexes
activate :relative_assets

set :css_dir, "assets/stylesheets"
set :markdown_engine, :redcarpet
set :markdown,
  autolink: true,
  fenced_code_blocks: true,
  footnotes: true,
  highlight: true,
  smartypants: true,
  strikethrough: true,
  tables: true,
  with_toc_data: true

page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false

activate :data_source do |d|
  d.sources = [
    {
      alias: "table_1",
      path:  "https://api.airtable.com/v0/appcUPqOCJXdPv2Um/Goal%20Paths?api_key=key9UPEYqOcEb8O5f",
      type:  :json
    },
    {
      alias: "table_2",
      path:  "https://api.airtable.com/v0/appcUPqOCJXdPv2Um/Steps?api_key=key9UPEYqOcEb8O5f",
      type:  :json
    },
    {
      alias: "table_3",
      path:  "https://api.airtable.com/v0/appcUPqOCJXdPv2Um/Categories?api_key=key9UPEYqOcEb8O5f",
      type:  :json
    },
    {
      alias: "table_4",
      path:  "https://api.airtable.com/v0/appcUPqOCJXdPv2Um/TIB?api_key=key9UPEYqOcEb8O5f",
      type:  :json
    }
  ]
end

["rec3AMHY8pTmqm4w4", "recoDaROQI7UD2O53", "recr7UAsDZpp3oWw8", "recukV4na77AsiWs0"].each do |category|
  proxy "/time-in-business/#{category}.html", "time-in-business.html", :locals => { :category_name => category }, :ignore => true
  ["recZTw2WuBr6bl3lE", "reca52edF4bAQxRe6", "recl4aMydpfKE3qsc"].each do |time_in_business|
    proxy "/register/#{category}/#{time_in_business}.html", "register.html", :locals => { :tib_name => time_in_business, :category_id => category}, :ignore => true
    proxy "/step/#{category}/#{time_in_business}.html", "step.html", :locals => { :tib_name => time_in_business, :category_id => category}, :ignore => true
  end
end





activate :livereload
