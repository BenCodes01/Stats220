library(magick)

# Frame 1 Spongebob as mechanical engineer
Spongebob_URL <- "https://pyxis.nymag.com/v1/imgs/7aa/21a/c1de2c521f1519c6933fcf0d08e0a26fef-27-spongebob-squarepants.rsquare.w700.jpg"
Spongebob_frame1 <- image_read(Spongebob_URL) %>%
  image_resize("500x500!") %>%
    image_annotate(text = "Mechanical\nEngineer",
                 color = "#000000",
                 size = 80,
                 font = "Impact",
                 gravity = "south")

# Frame 2 "And text"
and_Frame2 <- image_blank(width = 500, 
                    height = 500, 
                    color = "#000000") %>%
  image_annotate(text = "And",
                 color = "#FFFFFF",
                 size = 80,
                 font = "Impact",
                 gravity = "center")

# Frame 3 Patrick 
Patrick_URL <- "https://mb.com.ph/wp-content/uploads/2020/08/patrick.png"
Patrick_frame3 <- image_read(Patrick_URL) %>%
  image_resize("500x500!") %>%
  image_annotate(text = "Electrical\nEngineer",
                 color = "#000000",
                 size = 80,
                 font = "Impact",
                 gravity = "south")

# Frame 4 "Gives us..." text
gives_Us_Frame4 <- image_blank(width = 500, 
                        height = 500, 
                        color = "#000000") %>%
  image_annotate(text = "Gives us...",
                 color = "#FFFFFF",
                 size = 80,
                 font = "Impact",
                 gravity = "center")


# Frame 5 Mechanictrical Engineer
mechanictrical_URL <- "https://pyxis.nymag.com/v1/imgs/44d/13c/0ed4363f89e451cde26e4bfe48730be61f-patrick-star.jpg"
mechanictrical_Frame5 <- image_read(mechanictrical_URL) %>%
  image_resize("500x500!") %>%
  image_annotate(text = "Mechanictrical\nEngineer",
                 color = "#000000",
                 size = 80,
                 font = "Impact",
                 gravity = "south")

# Combining all the frames
frames <- c(Spongebob_frame1,and_Frame2,Patrick_frame3,gives_Us_Frame4,mechanictrical_Frame5)

# Animating the frames into a GIF
mechanictrical_GIF <- image_animate(frames, fps = 1)

# Saving the GIF
image_write(mechanictrical_GIF, "my_animation.gif")

