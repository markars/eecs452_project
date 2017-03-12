import pygame, sys
from pygame.locals import *

DISPLAYSURF = pygame.display.set_mode((800,480)) # numbers in pixels
## Explore fullscreen options

# Colors
## Deside about transparancy
GRAY = (197, 197, 197)
BLACK = (0, 0, 0)
BLUE = (27, 15, 193)
WHITE = (255, 255, 255)
MAIZE = (244, 238, 66)
RED  = (255, 0, 0)
GREEN = (0, 255, 0)


# Images
startLogo = pygame.image.load("images/startLogo.jpg")
startButton = pygame.image.load("images/startButton.jpg")
start_logo = pygame.transform.scale(startLogo, (400,400))
start_button = pygame.transform.scale(startButton, (200, 100))

pygame.init()

numPlayers = 1

# Font
logoFont = pygame.font.Font("wheel-of-fortune/SF Fortune Wheel Bold Italic.ttf", 28)
mainFont = pygame.font.Font("freesansbold.ttf", 17)
buttonFont = pygame.font.Font("freesansbold.ttf", 28)
headerFont = pygame.font.Font("freesansbold.ttf", 40)
loginText = headerFont.render("Login", True, BLACK)
logoText = logoFont.render("Guess That Phrase", True, MAIZE)
startText = logoFont.render("Start", True, BLUE)
enterNameText = mainFont.render("Write your Name: ", True, BLACK)
clearText = buttonFont.render("Clear", True, BLACK)
doneText = buttonFont.render("Done", True, BLACK)
monitorText = headerFont.render("Look up and smile!", True, BLACK)

# Font Sizes
loginTextW, loginTextH = headerFont.size("Login")
## Change all text so its in relation to other things on the screen


menu_rect = pygame.Rect(0, 0, 800, 480) ## possibly faster to use surfaces instead
start_button_rect = pygame.Rect(menu_rect.centerx - 95, menu_rect.centery+85, 190, 90)
enter_name_rect = pygame.Rect(100, 80, 600, 200) ## make vairables for cooridinates
clear_name_rect = pygame.Rect(103, 83, 594, 194)
clear_button_rect = pygame.Rect(450, 330, 200, 100)
done_button_rect = pygame.Rect(150, 330, 200, 100)

click = False
penSize = 5
penColor = BLACK
begin = False
numPlayers = 0

while True:
    for event in pygame.event.get():
        if event.type == QUIT:
            pygame.quit()
            sys.exit()
        if event.type == KEYDOWN:
            if event.key == K_ESCAPE:
                pygame.quit()
                sys.exit()
        if event.type == MOUSEBUTTONDOWN:
            click = True
        if event.type == MOUSEBUTTONUP:
            click = False

    # Start menu
    if begin == False:
        pygame.draw.rect(DISPLAYSURF, BLACK, menu_rect)
        pygame.draw.rect(DISPLAYSURF, BLACK, start_button_rect)
       # DISPLAYSURF.blit(start_logo, (menu_rect.centerx - 200, menu_rect.centery - 100))
        DISPLAYSURF.blit(start_button, (menu_rect.centerx - 100, menu_rect.centery+80))
        DISPLAYSURF.blit(startText, (menu_rect.centerx - 50, menu_rect.centery+120))
        DISPLAYSURF.blit(logoText, (menu_rect.centerx - 150, menu_rect.centery-10))

        # Collision Detection with start button
        mouse_pos = pygame.mouse.get_pos()

        if click == True:
            if start_button_rect.collidepoint(mouse_pos):
                DISPLAYSURF.fill(WHITE)
                click = False
                begin = True

    # Enter name menu
    elif begin == True:
        pygame.draw.rect(DISPLAYSURF, BLACK, enter_name_rect, 5)
        DISPLAYSURF.blit(enterNameText, (110, loginTextH + 20)) #60
        pygame.draw.rect(DISPLAYSURF, MAIZE, clear_button_rect)
        DISPLAYSURF.blit(clearText, (510, 370))
        pygame.draw.rect(DISPLAYSURF, BLUE, done_button_rect)
        DISPLAYSURF.blit(doneText, (210, 370))
        DISPLAYSURF.blit(loginText, (10, 10))

        mouse_pos = pygame.mouse.get_pos()
        if click == True and mouse_pos[0] > 103 and  mouse_pos[0] < 693 and mouse_pos[1] > 87 and mouse_pos[1] < 277:
            pygame.draw.circle(DISPLAYSURF, penColor, mouse_pos, penSize)

        elif click == True and clear_button_rect.collidepoint(mouse_pos):
            pygame.draw.rect(DISPLAYSURF, WHITE, clear_name_rect)

        elif click == True and done_button_rect.collidepoint(mouse_pos):
            click = False
            if numPlayers > 5:
                DISPLAYSURF.fill(BLACK)
            else:
                save_name = pygame.Surface((594, 194))
                save_name.blit(DISPLAYSURF, (0, 0), (103, 43, 594, 194))
                numPlayers = numPlayers + 1
                pygame.image.save(save_name, "faces/Player_" + str(numPlayers) + ".jpg")
                pygame.draw.rect(DISPLAYSURF, WHITE, clear_name_rect)

                # Direct Attention to Monitor
                pygame.Surface(menu_rect, BLUE, (0,0))
               # DISPLAY.blit(monitorText, (











    pygame.display.update()
