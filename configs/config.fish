if status is-interactive
	fish_vi_key_bindings
end

function grab_youtube_audio
	yt-dlp -f 'bestaudio[ext=m4a]' --output "%(uploader)s - %(title)s.%(ext)s" --postprocessor-args "-c:a libmp3lame -q:a  4" "$argv[1]"
end

funcsave grab_youtube_audio

