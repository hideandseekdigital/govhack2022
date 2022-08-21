import styles from './card.module.css'
import Image from 'next/image'


const KangarooPage: React.FC = () => {
    return (
        <div className={styles.collections}>
            <div className={`${styles.heroBanner} ${styles.green}`}>
                <Image src="/card/Frame_green.png" alt="Profile image" layout='fill' />

            </div>

            <div className={styles.profile}>
                <div className={`${styles.profileImage}`}>
                    <div className={`${styles.points} ${styles.greenpoint}`}>123PTS</div>
                    <div className={`${styles.image}  ${styles.greenbox}`}>
                        <Image src="/animals/kangaroo.svg" className='border-4 border-white' alt="Profile image" height={135} width={135} />
                    </div>
                </div>
                <div className={styles.profileInfo}>
                    <h2>Eastern Gray Kangaroo</h2>
                    <p>Macropus giganteus</p>
                    <span>Common</span>
                </div>
            </div>
            <div className={styles.animalCardImage}>
                <Image src="/card/kangaroo.png" alt="Profile image" layout='fill' />
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
                Eastern Grey Kangaroo, Macropus giganteus, is a marsupial mammal that belongs to a small group called macropods. They have hind legs that are larger than their forelimbs. Their hind feet are also large and powerful. Their long muscular tail is used for balance when hopping and as a fifth limb when movements are slow. The fur is a light grey woolly colour except the face which is darker. A dark tip of fur is also found on the tail.
            </div>


        </div>
    );
};
export default KangarooPage;
