rectangle {
  rounded
  color gray
  text "fill in empty runnable"
  circle {
    text "my Composite Template"
    color green
    stroke-width 3
    }
  circle {
    text "my runnable"
    color green
    stroke-width 1
    }
  rectangle {
    text "∀ children of my Composite Template"
    color white
    rounded
    cylinder {
      text "child"
      color green
      stroke-width 3
      }
    rectangle {
      rectangle {
	color green
	}
    rectangle {
      rounded
      color white
      text "create runnable children"
      rectangle {
	color green
	text "my runnable"
	}
      rectangle {
	color green
	text "child"
	}
      rectangle {
	color green
	text "my Composite Template"
	}
      rectangle {
	color yellow
	}
    }
    }
  }
