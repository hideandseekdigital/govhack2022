import styles from './card.module.css'
import Image from 'next/image'


const LizardPage: React.FC = () => {
    return (
        <div className={styles.collections}>
            <div className={`${styles.heroBanner} ${styles.purple}`}>
                <Image src="/card/Frame_purple.png" alt="Profile image" layout='fill' />

            </div>

            <div className={styles.profile}>
                <div className={`${styles.profileImage}`}>
                    <div className={`${styles.points} ${styles.purple}`}>123PTS</div>
                    <div className={`${styles.image}  ${styles.purple}`}>
                        <Image src="/animals/lizard.svg" className='border-4 border-white' alt="Profile image" height={135} width={135} />
                    </div>
                </div>
                <div className={styles.profileInfo}>
                    <h2>Grassland Earless Dragon</h2>
                    <p>Tympanocryptıs pınguıcolla</p>
                    <span>Epic</span>
                </div>
            </div>
            <div className={styles.animalCardImage}>
                <Image src="/card/lizard.png" alt="Profile image" layout='fill' />
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
                The little dragon is light brown with three white stripes running down and a number of darker bands running across its body. It is just 15cm from head to tail when fully grown. Unlike most other lizards it doesnt have external ear openings. Its an energetic little animal for its size and adults can move over 110 metres in a day. The Grassland Earless Dragon was once widespread throughout western Victoria, NSW and the ACT.
            </div>


        </div>
    );
};
export default LizardPage;
