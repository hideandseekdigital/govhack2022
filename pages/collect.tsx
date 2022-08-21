import styles from './Collect.module.css'
import Image from 'next/image'
import React, { useState, useEffect } from 'react';


const CollectPage: React.FC = () => {

    // On button click start timer
    const [seconds, setSeconds] = useState(10);
    const [isActive, setIsActive] = useState(false);
    const [isFinished, setIsFinished] = useState(false);
    const [hasWon, setHasWon] = useState(false);

    function toggle() {
        setIsActive(!isActive);
    }

    function reset() {
        setSeconds(0);
        setIsActive(false);
    }

    useEffect(() => {
        let interval: any;
        if (isActive) {
            interval = setInterval(() => {
                setSeconds(seconds => seconds - 1);
            }, 1000);
            setIsFinished(false)
        } else if (!isActive) {
            setSeconds(10);
            setIsFinished(false)
        }
        if (seconds === 0) {
            clearInterval(interval);
            setIsFinished(true)

        }
        return () => clearInterval(interval);
    }, [isActive, seconds]);

    useEffect(() => {
        let interval: any;
        if (isActive) {
            interval = setInterval(() => {
                setSeconds(seconds => seconds - 1);
            }, 1000);
            setIsFinished(false)
        } else if (!isActive) {
            setSeconds(10);
            setIsFinished(false)
        }
        if (seconds === 0) {
            clearInterval(interval);
            setIsFinished(true)

        }
        return () => clearInterval(interval);
    }, [isActive, seconds]);


    return (
        <div>
            {isActive &&
                <div className={styles.creature}>
                    <Image src="/animals/moth.svg" className='border-4 border-white' alt="Profile image" height={135} width={135} />

                </div>
            }

            {!isActive &&
                <div className={styles.startGame}>
                    <Image src="/animals/moth.svg" className='border-4 border-white' alt="Profile image" height={135} width={135} />
                    <h2>Oh look!</h2>
                    <p>You found a Golden Sun Moth! Collect it before it disappears!</p>
                    <button className={`button button-primary button-primary-${isActive ? 'active' : 'inactive'}`} onClick={toggle}>
                        {isActive ? 'Pause' : 'Start'}
                    </button>
                </div>
            }

            {isActive &&
                <div className={styles.timer}>
                    <div>{seconds}</div>
                </div>
            }


            {isFinished && <div>
                <h2>Try again!</h2>
                <p>Don’t worry, there are lots of other animals and plants out there. Don’t forget to check your map!</p>
                <button className={`button button-primary button-primary-${isActive ? 'active' : 'inactive'}`} onClick={toggle}>
                    {isActive ? 'Try Again' : 'Start'}
                </button>
            </div>}


            {hasWon && <div>
                <h2>Hooraaay!</h2>
                <p>You got it! You just added a Golden Sun Moth hatchable to your collection.</p>

            </div>}
        </div>
    );
};
export default CollectPage;
