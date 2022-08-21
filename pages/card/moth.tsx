import styles from './card.module.css'
import Image from 'next/image'


const MothPage: React.FC = () => {
    return (
        <div className={styles.collections}>
            <div className={`${styles.heroBanner} ${styles.yellow}`}>
                <Image src="/card/Frame_yellow.png" alt="Profile image" layout='fill' />

            </div>

            <div className={styles.profile}>
                <div className={`${styles.profileImage}`}>
                    <div className={`${styles.points} ${styles.yellow}`}>123PTS</div>
                    <div className={`${styles.image}  ${styles.yellow}`}>
                        <Image src="/animals/moth.svg" className='border-4 border-white' alt="Profile image" height={135} width={135} />
                    </div>
                </div>
                <div className={styles.profileInfo}>
                    <h2>Golden Sun Moth</h2>
                    <p>Synemon plana</p>
                    <span>Legendary</span>
                </div>
            </div>
            <div className={styles.animalCardImage}>
                <Image src="/card/moth.png" alt="Profile image" layout='fill' />
            </div>
            <div className={styles.animalCard}>

                <ul>
                    <li>Location
                        <ul>
                            <li>Blue Range, Brindabella Range</li>
                        </ul>
                    </li>
                    <li>Type<ul>
                        <li>Reptile</li>
                    </ul></li>
                    <li>Status <ul>
                        <li>Vulnarable</li>
                    </ul></li>
                </ul>
            </div>

            <div className={styles.animalInfo}>
                The females rarely fly, males can be seen flying in a zig-zag pattern in the warmest part of the day looking for the females. Females forewings are dark grey with lighter grey patterning; hind wings are reduced and are bright orange with black spots along the edges. Males forewings are dark brown with lighter grey patterning, hind wings bronze to brown with dark brown patches. Both males and females have clubbed antennae.
            </div>


        </div>
    );
};
export default MothPage;
