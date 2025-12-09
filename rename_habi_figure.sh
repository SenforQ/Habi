#!/bin/bash

# 脚本用于重命名 habi_figure 文件夹中的文件
# 图片格式: habi_character_x_img_y.webp
# 视频格式: habi_character_x_video_y.mp4 并导出封面图

BASE_DIR="/Users/gjm4senfor/Desktop/Habi/assets/habi_figure"

cd "$BASE_DIR" || exit 1

# 遍历每个文件夹
for folder in {1..20}; do
    if [ ! -d "$folder" ]; then
        continue
    fi
    
    echo "处理文件夹: $folder"
    cd "$folder" || continue
    
    # 分离图片和视频文件
    image_files=()
    video_files=()
    
    for file in *; do
        if [ -f "$file" ]; then
            case "$file" in
                *.webp|*.png|*.jpg|*.jpeg)
                    image_files+=("$file")
                    ;;
                *.mp4|*.mov|*.avi)
                    video_files+=("$file")
                    ;;
            esac
        fi
    done
    
    # 按文件名排序图片
    IFS=$'\n' sorted_images=($(printf '%s\n' "${image_files[@]}" | sort))
    
    # 重命名图片文件
    img_index=1
    for img_file in "${sorted_images[@]}"; do
        # 如果不是webp格式，先转换
        if [[ ! "$img_file" == *.webp ]]; then
            echo "  转换图片: $img_file -> webp"
            new_webp="${img_file%.*}.webp"
            if command -v sips &> /dev/null; then
                sips -s format webp "$img_file" --out "$new_webp" &> /dev/null
                rm "$img_file"
                img_file="$new_webp"
            elif command -v convert &> /dev/null; then
                convert "$img_file" "$new_webp"
                rm "$img_file"
                img_file="$new_webp"
            else
                echo "  警告: 无法转换 $img_file 为 webp，跳过"
                continue
            fi
        fi
        
        # 重命名为目标格式
        new_name="habi_character_${folder}_img_${img_index}.webp"
        if [ "$img_file" != "$new_name" ]; then
            mv "$img_file" "$new_name"
            echo "  重命名图片: $img_file -> $new_name"
        fi
        ((img_index++))
    done
    
    # 处理视频文件
    video_index=1
    for video_file in "${video_files[@]}"; do
        # 重命名视频
        new_video_name="habi_character_${folder}_video_${video_index}.mp4"
        if [[ "$video_file" == *.mp4 ]]; then
            if [ "$video_file" != "$new_video_name" ]; then
                mv "$video_file" "$new_video_name"
                echo "  重命名视频: $video_file -> $new_video_name"
            fi
        else
            # 如果不是mp4，需要转换
            echo "  转换视频: $video_file -> mp4"
            if command -v ffmpeg &> /dev/null; then
                ffmpeg -i "$video_file" -c:v libx264 -c:a aac "$new_video_name" -y &> /dev/null
                rm "$video_file"
            else
                echo "  警告: 无法转换 $video_file 为 mp4，跳过"
                continue
            fi
        fi
        
        # 提取视频封面图
        cover_name="habi_character_${folder}_video_${video_index}_cover.webp"
        if command -v ffmpeg &> /dev/null; then
            echo "  提取封面: $new_video_name -> $cover_name"
            # 提取第一帧并直接转换为webp
            ffmpeg -i "$new_video_name" -ss 00:00:00.100 -vframes 1 -vf "scale=iw:-1" "$cover_name" -y 2>/dev/null
            if [ ! -f "$cover_name" ]; then
                # 如果直接转换失败，先提取为png再转换
                temp_png="${cover_name%.webp}.png"
                ffmpeg -i "$new_video_name" -ss 00:00:00.100 -vframes 1 "$temp_png" -y 2>/dev/null
                if [ -f "$temp_png" ]; then
                    if command -v sips &> /dev/null; then
                        sips -s format webp "$temp_png" --out "$cover_name" &> /dev/null
                        rm "$temp_png"
                    elif command -v convert &> /dev/null; then
                        convert "$temp_png" "$cover_name" 2>/dev/null
                        rm "$temp_png"
                    fi
                fi
            fi
        else
            echo "  警告: ffmpeg 未安装，无法提取视频封面"
        fi
        
        ((video_index++))
    done
    
    cd ..
done

echo "完成！"

