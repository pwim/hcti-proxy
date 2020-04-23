require "net/http"
require "json"

use Rack::ShowExceptions
run -> (env) {
  uri = URI("https://#{ENV["HCTI_USER"]}:#{ENV["HCTI_API_KEY"]}@hcti.io/v1/image")
  image_result = Net::HTTP.post_form(
    uri,
    url: File.join(ENV["BASE_URL"], Rack::Request.new(env).path),
    viewport_width: 1200,
    viewport_height: 600,
    device_scale: 2)
  image_url = JSON.parse(image_result.body)["url"]

  Rack::Response.new.tap {|response| response.redirect(image_url) }.finish
}
