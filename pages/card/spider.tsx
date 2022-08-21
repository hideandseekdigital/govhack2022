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
                The redback spider (Latrodectus hasselti), also known as the Australian black widow,[2][3][4] is a species of highly venomous spider believed to originate in South Australia or adjacent Western Australian deserts, but now found throughout Australia, Southeast Asia and New Zealand, with colonies elsewhere outside Australia.[5] It is a member of the cosmopolitan genus Latrodectus, the widow spiders. The adult female is easily recognised by her spherical black body with a prominent red stripe on the upper side of her abdomen and an hourglass-shaped red/orange streak on the underside. Females usually have a body length of about 10 millimetres (0.4 in), while the male is much smaller, being only 3–4 mm (0.12–0.16 in) long.

                Mainly nocturnal, the female redback lives in an untidy web in a warm sheltered location, commonly near or inside human residences. It preys on insects, spiders and small vertebrates that become ensnared in its web. It kills its prey by injecting a complex venom through its two fangs when it bites, before wrapping them in silk and sucking out the liquefied insides. Often, it first squirts its victim with what resembles superglue from its spinnerets, immobilising the prey by sticking the victims limbs and appendages to its own body. The redback spider then trusses the victim with silk. Once its prey is restrained, it is bitten repeatedly on the head, body and leg segments and is then hauled back to the redback spiders retreat. Sometimes a potentially dangerous victim can be left to struggle for hours until it is exhausted enough to approach safely.[5] Male spiders and spiderlings often live on the periphery of the female spiders web and steal leftovers. Other species of spider and parasitoid wasps prey on this species. The redback is one of a number of arachnids that usually display sexual cannibalism while mating.

                After mating sperm is stored in the spermathecae, organs of the female reproductive tract, and can be used up to two years later to fertilise several clutches of eggs. Each clutch averages 250 eggs and is housed in a round white silken egg sac. The redback spider has a widespread distribution in Australia, and inadvertent introductions have led to established colonies in New Zealand, the United Arab Emirates, Japan and greenhouses in Belgium.[6]

                The redback is one of the few spider species that can be seriously harmful to humans, and its liking for habitats in built structures has led it to being responsible for a large number of serious spider bites in Australia. Predominantly neurotoxic to vertebrates, the venom gives rise to the syndrome of latrodectism in humans; this starts with pain around the bite site, which typically becomes severe and progresses up the bitten limb and persists for over 24 hours. Sweating in localised patches of skin occasionally occurs and is highly indicative of latrodectism. Generalised symptoms of nausea, vomiting, headache, and agitation may also occur and indicate severe envenomation. An antivenom has been available since 1956.
            </div>


        </div>
    );
};
export default SpiderPage;
