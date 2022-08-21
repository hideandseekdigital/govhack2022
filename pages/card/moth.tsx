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
                It is a medium-sized moth with clubbed antennae. The clubbed antennae are a notable feature of Synemon plana; most other moths have brushy antennae. The golden sun moth appears on the list of Australian critically endangered fauna. The golden sun moth is synonymous with Austrodanthonia species of grasses and is almost confined to grasslands which are home to these grass species. At least a 40% cover of Austrodanthonia species is optimal for the species.[1]

                Male Synemon plana are dull in colour, the forewings consisting of dark brown, patterned with pale grey and the hind wings are brown with darker brown patches. Female Synemon plana are brighter in colour with the forewings of brown and grey patterns, the forewings are a bright golden brown colouring with dark brown patches on the outer margin of the hindwings. This golden colouring gives Synemon plana its common name, the golden sun moth. Female Synemon plana are generally flightless, with small hindwings in comparison to the male.
            </div>


        </div>
    );
};
export default MothPage;
