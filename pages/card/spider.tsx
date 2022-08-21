import styles from './card.module.css'
import Image from 'next/image'


const SpiderPage: React.FC = () => {
    return (
        <div className={styles.collections}>
            <div className={`${styles.heroBanner} ${styles.red}`}>
                <Image src="/card/Frame_red.png" alt="Profile image" layout='fill' />

            </div>

            <div className={styles.profile}>
                <div className={`${styles.profileImage}`}>
                    <div className={`${styles.points} ${styles.red}`}>123PTS</div>
                    <div className={`${styles.image}  ${styles.red}`}>
                        <Image src="/animals/spider.svg" className='border-4 border-white' alt="Profile image" height={135} width={135} />
                    </div>
                </div>
                <div className={styles.profileInfo}>
                    <h2>Redback Spider</h2>
                    <p>Latrodectus hasselti</p>
                    <span>Agro</span>
                </div>
            </div>
            <div className={styles.animalCardImage}>
                <Image src="/card/spider.png" alt="Profile image" layout='fill' />
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

            <div className={styles.animalInfo} >
                Caution with this one kids! Redback spiders (Latrodectus hasselti) belong to the Family Theridiidae, which is found worldwide. Female Redback Spiders are black (occasionally brownish) with an obvious orange to red longitudinal stripe on the upper abdomen, with the red stripe sometimes being broken, and an hourglass shaped red/orange spot on the underside of the abdomen. Females have a body about the size of a large pea and slender legs. The males red markings are often less distinct. The body is light brown with white markings on the upper side of the abdomen, and a pale hour-glass marking on the underside.
            </div>


        </div>
    );
};
export default SpiderPage;
