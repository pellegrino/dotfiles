task :install => [ "install:zsh", "install:config_files", "install:vim", "install:bin" ] 

desc "Installs vim to the current machine"
namespace "install" do
  task :prepare do
    `mkdir -p ~/bin` 
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

  namespace "vim" do
    task "symlink" do
      puts "installing vim"
      # Creating vim swap files directory `mkdir -p ~/.vimswap/tmp` `ln -nfs ~/dotfiles/vim/vim ~/.vim`
      `ln -nfs ~/dotfiles/vim/vimrc ~/.vimrc`
      `ln -nfs ~/dotfiles/vim/gvimrc ~/.gvimrc`
      `ln -nfs ~/dotfiles/vim ~/.vim`
    end 

    task "plugins" do
      puts "Fetching vim plugins" 	
      `git submodule update --init` # vim plugins used as submodules 
    end 

    task "commandt" => "plugins" do
      puts "Attempting to build command-t" 
      `cd ~/dotfiles/vim/bundle/command-t; rake make`
    end 

  end 
  # Install vim  
  task "vim" => ["vim:symlink", "vim:plugins", "vim:commandt"]

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
      next if file =~ /Rakefile/ or File.directory? file 
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
    command = "ln -nfs #{zsh_directory} #{home}/.zsh-extra"
    sh command 
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
        command = "rm  #{target}"
        sh command 
      end 
    end
  end 

  task :bin do
    puts "Uninstall binaries"	
    home = File.expand_path('~') 
    Dir['bin/*'].each do |file|
      target = File.join(home, "#{file}")
      if File.symlink? target 
        command = "rm  #{target}"
        sh command 
      end
    end 
  end 
end 

task "uninstall" => ["uninstall:base", "uninstall:bin"]


