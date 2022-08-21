import styles from './card.module.css'
import Image from 'next/image'


const GliderPage: React.FC = () => {
    return (
        <div className={styles.collections}>
            <div className={styles.heroBanner}>
                <Image src="/card/Frame_blue.png" alt="Profile image" layout='fill' />

            </div>

            <div className={styles.profile}>
                <div className={styles.profileImage}>
                    <div className={styles.points}>123PTS</div>
                    <div className={styles.image}>
                        <Image src="/animals/glider.svg" className='border-4 border-white' alt="Profile image" height={135} width={135} />
                    </div>
                </div>
                <div className={styles.profileInfo}>
                    <h2>Greater Glider</h2>
                    <p>Petauroides</p>
                    <span>Rare</span>
                </div>
            </div>
            <div className={styles.animalCardImage}>
                <Image src="/card/glider.png" alt="Profile image" layout='fill' />
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
                The Greater Glider is Australia’s largest gliding mammal. Greater Gliders have thick, dark grey-brown fur on their back and creamy white fur on their under-side, and can be found in different dark and light-coloured morphs. They have a long, furry prehensile tail and large furry ears.
            </div>


        </div>
    );
};
export default GliderPage;
