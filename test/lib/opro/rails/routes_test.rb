require "test_helper"

class OproRoutesTest < ActiveSupport::TestCase
  test "mount_opro_oauth accepts legacy options hashes" do
    routes = ActionDispatch::Routing::RouteSet.new

    routes.draw do
      mount_opro_oauth({ except: [:auth, :client_apps, :docs, :tests] })
    end

    assert_includes routes.named_routes.names, :oauth_token
  end

  test "mount_opro_oauth accepts keyword options" do
    routes = ActionDispatch::Routing::RouteSet.new

    routes.draw do
      mount_opro_oauth except: [:auth, :client_apps, :docs, :tests]
    end

    assert_includes routes.named_routes.names, :oauth_token
  end
end
