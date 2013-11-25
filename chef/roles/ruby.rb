name "ruby"
description "The bare essentials for servers that are using ruby."

run_list([
  "recipe[ruby_build]",
  "recipe[rbenv::system]",
  "recipe[rubygems::client]",
  "recipe[bundler]",
  "recipe[bundler::auto_exec]",
])

default_attributes({
  :rbenv => {
    # Don't use the git:// protocol behind our firewall.
    :git_url => "https://github.com/sstephenson/rbenv.git",
    :git_ref => "v0.4.0",
    :upgrade => true,
    :root_path => "/opt/rbenv",
    :rubies => ["1.9.3-p484"],
    :global => "1.9.3-p484",
  },
  :ruby_build => {
    # Don't use the git:// protocol behind our firewall.
    :git_url => "https://github.com/sstephenson/ruby-build.git",
    :git_ref => "v20131122",
    :upgrade => true,
  },
  :rubygems => {
    :version => "2.1.11",
    :default_options => "--no-ri --no-rdoc",
  },
  :bundler => {
    :version => "1.3.5",
  },
})