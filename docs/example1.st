# This is a text-code translation of https://scratch.mit.edu/projects/11788691

stage:
    backdrops('stars': '99.png')

sprite('Player'):
    costumes('spaceship-a4': '0.png', 'spaceship-a2': '1.png', 'spaceship-a3': '2.png')
    sounds('meow': '0.wav')

    whenFlagClicked:
        goToXY(0, 0)
        show
        forever:
            pointTowards('mouse-pointer')
            moveSteps(5)
            nextCostume

    whenIReceive('game over'):
        hide
        stopOtherScriptsInSprite

    whenFlagClicked:
        set('Time', 0)
        forever:
            wait(0.1)
            change('Time', 0.1)

    distanceTo()

sprite('Explosion'):
    costumes('explosion13_37': '3.png', 'explosion13_38': '4.png', 'explosion13_39': '5.png', 'explosion13_40': '6.png', 'explosion13_41': '7.png', 'explosion13_42': '8.png', 'explosion13_43': '9.png', 'explosion13_44': '10.png')

    whenFlagClicked:
        hide

    whenIReceive('game over'):
        switchCostumeTo('explosion13_05')
        goTo('player')
        show
        repeat(8):
            wait(0.03)
            nextCostume
        hide
        wait(2)
        stopAll

sprite('Meteor 1'):
    costumes('costume1': '11.png', 'costume2': '12.png', 'costume3': '13.png',  'costume4': '14.png')

    whenFlagClicked:
        repeat(8):
            createCloneOf('myself')
        hide

    whenIStartAsAClone:
        forever:
            hide
            wait(pickRandom(10, 50) / 10)
            pointInDirection(pickRandom(-20, 20) - 180)
            setXTo(pickRandom(-240, 240))
            setYTo(180)
            show
            repeatUntil(yPosition < -160):
                nextCostume
                moveSteps(10)
                if(touching('Player')):
                    broadcast('game over')
