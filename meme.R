library(magick)

# Top row ----------------------------------------------------------------------
# Happy Spongebob image
happy_Spongebob_URL <- "https://upload.wikimedia.org/wikipedia/en/thumb/3/3b/SpongeBob_SquarePants_character.svg/1200px-SpongeBob_SquarePants_character.svg.png"
happy_Spongebob <- image_read(happy_Spongebob_URL) %>% 
    image_resize("500x500!")

# Happy Spongebob text
happy_Spongebob_text <- image_blank(width = 500, 
                        height = 500, 
                        color = "#000000") %>%
  image_annotate(text = "Industrial\nAge",
                 color = "#FFFFFF",
                 size = 80,
                 font = "Impact",
                 gravity = "center")

# Bottom row -------------------------------------------------------------------
# Magically excited Spongebob image
excited_Spongebob_URL <- "https://free4kwallpapers.com/uploads/originals/2015/08/16/spongebob-magic-1920x1200.jpg"
excited_Spongebob <- image_read(excited_Spongebob_URL) %>%
    image_resize("500x500!")

# Excited Spongebob text
excited_Spongebob_text <- image_blank(width = 500, 
                                    height = 500, 
                                    color = "#000000") %>%
  image_annotate(text = "Information\nAge",
                 color = "#FFFFFF",
                 size = 80,
                 font = "Impact",
                 gravity = "center")

# Combining top and bottom rows together ---------------------------------------
# Top row 
happy_Spongebob_vector <- c(happy_Spongebob, happy_Spongebob_text)
top_row <- image_append(happy_Spongebob_vector)

# Bottom row
excited_Spongebob_vector <- c(excited_Spongebob, excited_Spongebob_text)
bottom_row <- image_append(excited_Spongebob_vector)

# Stacking the images
Spongebob_meme <- c(top_row, bottom_row) %>%
  image_append(stack = TRUE) %>%
  image_scale(800)

# Saving the meme --------------------------------------------------------------

image_write(Spongebob_meme, "my_meme.png")

