desc "Installs vim to the current machine"
namespace "install" do
  task :vim do
    `ln -nls ~/dotfiles/vim/vim .vim`
    `ln -nls ~/dotfiles/vim/vimrc .vimrc`
    `ln -nls ~/dotfiles/vim/gvimrc .gvimrc`
  end 
  task :config_files  do
    `ln -nls ~/dotfiles/bashrc .bashrc` 
  end 
end 


