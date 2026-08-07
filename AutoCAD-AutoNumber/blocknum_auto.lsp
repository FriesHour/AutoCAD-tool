;; ============================================
;; 自动编号工具 - AutoLISP脚本
;; 功能：点击位置自动创建编号（红色）
;; 版本：3.0
;; ============================================

;; 全局变量初始化
(if (not *blocknum_layer*) (setq *blocknum_layer* "编号层"))
(if (not *blocknum_prefix*) (setq *blocknum_prefix* "XZ-"))
(if (not *blocknum_height*) (setq *blocknum_height* 300))
(if (not *blocknum_style*) (setq *blocknum_style* "宋体"))
(if (not *blocknum_current*) (setq *blocknum_current* 0))
(if (not *blocknum_color*) (setq *blocknum_color* 1))  ; 红色

;; ============================================
;; 主命令：点击创建编号
;; ============================================
(defun c:BN (/ pt layer_exists current_layer prefix start_num input_str)
  ;; 保存当前图层
  (setq current_layer (getvar "CLAYER"))

  ;; 检查并创建编号图层
  (setq layer_exists (check_layer_exists *blocknum_layer*))

  ;; 如果图层不存在，创建它
  (if (not layer_exists)
    (progn
      (command "LAYER" "M" *blocknum_layer* "C" "1" *blocknum_layer* "")  ; 红色图层
      (princ (strcat "\n已创建图层: " *blocknum_layer* " (红色)"))
    )
  )

  ;; 获取编号前缀
  (setq prefix (getstring (strcat "\n输入编号前缀 <" *blocknum_prefix* ">: ")))
  (if (= prefix "")
    (setq prefix *blocknum_prefix*)
    (setq *blocknum_prefix* prefix)
  )

  ;; 获取起始编号
  (setq input_str (getstring (strcat "\n输入起始编号 <" (itoa *blocknum_current*) ">: ")))
  (if (= input_str "")
    (setq start_num *blocknum_current*)
    (setq start_num (atoi input_str))
  )

  ;; 保存起始编号
  (setq *blocknum_current* start_num)

  ;; 显示当前设置
  (princ (strcat "\n==================================="))
  (princ (strcat "\n编号格式: " prefix "1, " prefix "2, " prefix "3..."))
  (princ (strcat "\n起始编号: " prefix (itoa start_num)))
  (princ (strcat "\n文字高度: " (itoa *blocknum_height*)))
  (princ (strcat "\n==================================="))

  ;; 获取用户点击位置
  (princ (strcat "\n当前将创建: " prefix (itoa start_num)))
  (setq pt (getpoint "\n点击插入编号的位置: "))

  (while pt
    ;; 创建编号文字
    (create_blocknum pt start_num prefix)

    ;; 递增编号
    (setq start_num (1+ start_num))
    (setq *blocknum_current* start_num)

    ;; 继续获取下一个位置
    (princ (strcat "\n当前将创建: " prefix (itoa start_num)))
    (setq pt (getpoint "\n点击插入编号的位置(或按ESC退出): "))
  )

  ;; 恢复当前图层
  (setvar "CLAYER" current_layer)

  (princ (strcat "\n完成！最后编号: " prefix (itoa (1- start_num))))
  (princ)
)

;; ============================================
;; 创建编号文字（红色）
;; ============================================
(defun create_blocknum (pt num prefix / layer_name text_str)
  (setq layer_name *blocknum_layer*)
  (setq text_str (strcat prefix (itoa num)))

  ;; 创建单行文字
  (entmake (list
    '(0 . "TEXT")                    ; 单行文字
    (cons 8 layer_name)              ; 图层
    (cons 10 pt)                     ; 插入点
    (cons 40 *blocknum_height*)     ; 高度
    (cons 1 text_str)                ; 文字内容
    (cons 62 *blocknum_color*)       ; 文字颜色
    '(72 . 0)                        ; 左对齐
    '(73 . 0)                        ; 基线对齐
  ))
)

;; ============================================
;; 检查图层是否存在
;; ============================================
(defun check_layer_exists (layer_name / layers layer_obj)
  ;; 使用VisualLISP检查图层是否存在
  (vl-load-com)
  (setq layers (vla-get-layers (vla-get-activedocument (vlax-get-acad-object))))
  (setq layer_exists nil)

  (vlax-for layer layers
    (if (= (strcase (vla-get-name layer)) (strcase layer_name))
      (setq layer_exists T)
    )
  )

  layer_exists
)

;; ============================================
;; 辅助命令：设置文字高度
;; ============================================
(defun c:BNHEIGHT (/ new_height)
  (setq new_height (getdist (strcat "\n输入文字高度 <" (itoa *blocknum_height*) ">: ")))
  (if new_height
    (setq *blocknum_height* new_height)
  )
  (princ (strcat "\n文字高度设置为: " (itoa *blocknum_height*)))
  (princ)
)

;; ============================================
;; 辅助命令：设置文字颜色
;; ============================================
(defun c:BNCOLOR (/ new_color color_name)
  (setq new_color (getint (strcat "\n输入文字颜色代码(1=红色,2=黄色,3=绿色,4=青色,5=蓝色,6=洋红,7=白色) <" (itoa *blocknum_color*) ">: ")))
  (if new_color
    (setq *blocknum_color* new_color)
  )
  (princ (strcat "\n文字颜色设置为: " (itoa *blocknum_color*)))
  (princ)
)

;; ============================================
;; 辅助命令：设置编号图层
;; ============================================
(defun c:BNLAYER (/ new_layer)
  (setq new_layer (getstring (strcat "\n输入编号图层名 <" *blocknum_layer* ">: ")))
  (if (/= new_layer "")
    (setq *blocknum_layer* new_layer)
  )
  (princ (strcat "\n编号图层设置为: " *blocknum_layer*))
  (princ)
)

;; ============================================
;; 加载提示
;; ============================================
(princ "\n===================================")
(princ "\n   自动编号工具已加载 v3.0")
(princ "\n===================================")
(princ "\n使用方法：")
(princ "\n   1. 输入 BN 命令")
(princ "\n   2. 输入编号前缀（如 XZ-）")
(princ "\n   3. 输入起始编号（如 1）")
(princ "\n   4. 点击位置创建编号")
(princ "\n===================================")
(princ "\n辅助命令:")
(princ "\n   BNHEIGHT - 设置文字高度")
(princ "\n   BNCOLOR  - 设置文字颜色")
(princ "\n   BNLAYER  - 设置编号图层")
(princ "\n===================================")
(princ)
