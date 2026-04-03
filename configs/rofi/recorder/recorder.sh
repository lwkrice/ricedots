#!/usr/bin/env bash

theme="$HOME/.config/rofi/recorder/style.rasi"
outdir="$HOME/media/recordings"
mkdir -p "$outdir"

is_recording=$(pgrep -x wf-recorder)

if [ -n "$is_recording" ]; then
    status_msg="󰃽 Recording"
    chosen=$(printf "󰓛 Stop\n Pause / Resume\n  Open folder" | rofi -dmenu -p "" -mesg "$status_msg" -theme "$theme")
else
    status_msg="󰕧 Idle"
    chosen=$(printf " Start\n  Open folder" | rofi -dmenu -p "" -mesg "$status_msg" -theme "$theme")
fi

[ -z "$chosen" ] && exit

case "$chosen" in
    " Start")
        filename="$outdir/$(date +%Y-%m-%d_%H-%M-%S).mkv"
        notify-send "Recording started" "$filename"
        wf-recorder -f $filename --codec=h264_nvenc -p profile=high444p -p cq=18 color_range=pc pix_fmt=yuv444p -r 180 &
        ;;
    "󰓛 Stop")
        pkill -INT wf-recorder
        notify-send "Recording stopped"
        ;;
    " Pause / Resume")
        if pkill -STOP wf-recorder 2>/dev/null; then
            notify-send "Recording paused"
        else
            pkill -CONT wf-recorder
            notify-send "Recording resumed"
        fi
        ;;
    "  Open folder")
        pcmanfm "$outdir"
        ;;
esac
