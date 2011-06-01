desc "Installs vim to the current machine"
namespace "install" do
  task :bin do
    puts "Installing configuration files"	
    home = File.expand_path('~/') 
    Dir['bin/*'].each do |file|
      target = File.join(home, "#{file}")
      command = "ln -nfs #{File.expand_path file} #{target}"
      puts command 
      `ln -nfs #{File.expand_path file} #{target}`
    end 
  end 	
  task :vim do
    `ln -nfs ~/dotfiles/vim/vim ~/.vim`
    `ln -nfs ~/dotfiles/vim/vimrc ~/.vimrc`
    `ln -nfs ~/dotfiles/vim/gvimrc ~/.gvimrc`
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
end 


