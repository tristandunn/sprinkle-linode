package :git, :provides => :scm do
  description 'Git version control client'
  version '1.6.1.2'
  source "http://kernel.org/pub/software/scm/git/git-#{version}.tar.gz"
  requires :git_dependencies
end

package :git_dependencies do
  description 'Git build dependencies'
  apt 'git', :dependencies_only => true
end