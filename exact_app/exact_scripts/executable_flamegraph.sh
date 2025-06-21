#!/usr/bin/zsh
flamegraph() {
    # 参数校验
    if [[ $# -eq 0 ]]; then
        echo "Usage: flamegraph <executable>"
        return 1
    fi

    # 设置输出文件名（默认与可执行文件同名）
    local executable="$1"
    local svg_name="${executable##*/}.svg"

    # 执行性能采样并生成火焰图
    perf record -F 99 -g -- "$executable" && \
    perf script | /usr/bin/stackcollapse-perf.pl | /usr/bin/flamegraph.pl > "$svg_name"

    # 清理临时文件（可选）
    rm -f perf.data perf.unfold perf.folded

    echo "FlameGraph generated: $svg_name"
}
