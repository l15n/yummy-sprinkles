package :git, :provides => :scm do
  description 'Git Distributed Version Control'
  version '1.6.1'
  source "http://kernel.org/pub/software/scm/git/git-#{version}.tar.gz"
  requires :git_dependencies
  
  verify do
    has_file '/usr/local/bin/git'
  end
end

package :git_dependencies do
  description 'Git Build Dependencies'
  yum %w(expat-devel curl-devel zlib-devel openssl-devel)
end

package :subversion, :provides => :scm do
  description 'Subversion: open source version control.'
  version = '1.6.6'
  download_path = "http://subversion.tigris.org/downloads"
  subversion_deps = "subversion-deps-#{version}.tar.bz2"
  source "#{download_path}/subversion-#{version}.tar.bz2" do
    post :extract do # NOTE: working around buggy pre/post command merging
        "wget -cq --directory-prefix=/usr/local/src #{download_path}/#{subversion_deps} && " +
        "cd .. && tar xjf /usr/local/src/#{subversion_deps}"
    end
  end

  verify do
    has_executable '/usr/local/bin/svn'
  end
end