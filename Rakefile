task :install => [ "install:config_files", "install:vim", "install:bin" ] 

desc "Installs vim to the current machine"
namespace "install" do
	task :prepare do
		`mkdir -p ~/bin` 
		`mkdir -p ~/.tmp` 
	end	
	task :bin => "install:prepare" do
		puts "Installing configuration files"	
		home = File.expand_path('~') 
		Dir['bin/*'].each do |file|
			target = File.join(home, "#{file}")
			command = "ln -nfs #{File.expand_path file} #{target}"
			puts command 
			`ln -nfs #{File.expand_path file} #{target}`
		end 
	end 	
	task :vim do
		# Creating vim swap files directory 
		`mkdir -p ~/.vimswap/tmp` 
		`ln -nfs ~/dotfiles/vim/vim ~/.vim`
		`ln -nfs ~/dotfiles/vim/vimrc ~/.vimrc`
		`ln -nfs ~/dotfiles/vim/gvimrc ~/.gvimrc`
		`ln -nfs ~/dotfiles/vim ~/.vim`

		`git submodule update --init` # vim plugins used as submodules 
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


