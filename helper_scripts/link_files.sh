function link_folders() {
	folder_array=("$@")
	mkdir -p $HOME/.config

	for folder in "${folder_array[@]}"; do
		ln -sfn $DOTS_FOLDER/config/$folder $HOME/.config/
	done
}

function link_files() {
	file_array=("$@")

	for file in "${file_array[@]}"; do
		ln -sfn $DOTS_FOLDER/config/$file $HOME/$file
	done
}
