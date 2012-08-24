task :install => [ "install:zsh", "install:config_files", "install:vim",
                   "install:bin", "install:lib", "install:rvm", "install:emacs" ]

DOTFILES_DIR = "~/dotfiles"
VIM_DIR      = File.join DOTFILES_DIR , "vim"
EMACS_DIR    = File.join DOTFILES_DIR , "emacs.d"

desc "Installs vim to the current machine"
namespace "install" do
  task :prepare do
    `mkdir -p ~/bin`
    `mkdir -p ~/.lib`
    `mkdir -p ~/.tmp` end
  task :bin => "install:prepare" do
    puts "Installing binaries files"
    home = File.expand_path('~')
    Dir['bin/*'].each do |file|
      target = File.join(home, "#{file}")
      command = "ln -nfs #{File.expand_path file} #{target}"
      puts command
      `ln -nfs #{File.expand_path file} #{target}`
    end
  end

  task :lib => "install:prepare" do
    puts "Installing libraries"
    home = File.expand_path('~')
    Dir['lib/*'].each do |file|
      target = File.join(home, ".#{file}")
      command = "ln -nfs #{File.expand_path file} #{target}"
      puts command
      `ln -nfs #{File.expand_path file} #{target}`
    end
  end


  namespace "vim" do
    task "symlink" do
      puts "installing vim"
       #Creating vim swap files directory
      sh "mkdir -p ~/.vimswap/tmp"
      sh "ln -nfs #{VIM_DIR}/vim ~/.vim"
      sh "ln -nfs #{VIM_DIR}/vimrc ~/.vimrc"
      sh "ln -nfs #{VIM_DIR}/gvimrc ~/.gvimrc"

      sh "ln -nfs #{DOTFILES_DIR}/vim ~/.vim"
    end

    task "plugins" do
      puts "Fetching vim plugins"
      # vim plugins are used as submodules
      sh "git submodule update --init"
    end

    task "commandt" => "plugins" do
      puts "Attempting to build command-t"
      sh "cd #{VIM_DIR}/bundle/command-t; rake make"
    end

  end
  # Install vim
  task "vim" => ["vim:symlink", "vim:plugins", "vim:commandt"]

  task "emacs"  do
    sh "ln -nfs #{EMACS_DIR} ~/.emacs.d"
  end

  task :rvm do
    `bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)`
  end
  task :irssi do
    home = File.expand_path('~')
    irssi_directory = File.expand_path("irssi")
    command = "ln -nfs #{irssi_directory} #{home}/.irssi"
    puts command
    `#{command}`
  end
  task :config_files  do
    puts "Installing configuration files"
    home = File.expand_path('~')

    Dir['*'].each do |file|
      next if file =~ /Rakefile/ or /README.md/ or File.directory? file
      target = File.join(home, ".#{file}")
      command = "ln -nfs #{File.expand_path file} #{target}"
      puts command
      `ln -nfs #{File.expand_path file} #{target}`
    end

  end
  desc "Installs zsh with custom scripts at zsh-extra"
  task :zsh do
    puts "Installing zsh"
    home = File.expand_path('~')
    zsh_directory = File.expand_path("zsh-extra")
    sh "ln -nfs #{zsh_directory} #{home}/.zsh-extra"
  end


  desc "Installs rvm from get.rvm.io"
  task :rvm do
    puts "Installing rvm from get.rvm.io"
    sh "curl -L get.rvm.io | bash -s stable"
  end
end

namespace :uninstall do
  desc "Uninstall dotfiles"
  task :base do
    puts "Uninstall dotfiles"
    home = File.expand_path('~')
    Dir['*'].each do |file|
      target = File.join(home, ".#{file}")
      if File.symlink? target
        sh "rm  #{target}"
      end
    end
  end

  task :bin do
    puts "Uninstall binaries"
    home = File.expand_path('~')
    Dir['bin/*'].each do |file|
      target = File.join(home, "#{file}")
      if File.symlink? target
        sh "rm  #{target}"
      end
    end
  end
end

task "uninstall" => ["uninstall:base", "uninstall:bin"]


