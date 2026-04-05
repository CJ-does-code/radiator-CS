import <zlib.ash>;

string current_state = "Pre-Quest";

int get_cs_questNum(string input)
{
	input = to_lower_case(input);
	if(input == "hp")
	{
		return 1;
	}
	if((input == "mus") || (input == "muscle") || (input == "musc"))
	{
		return 2;
	}
	if((input == "myst") || (input == "mysticality"))
	{
		return 3;
	}
	if((input == "mox") || (input == "moxie"))
	{
		return 4;
	}
	if((input == "familiar weight") || (input == "familiar") || (input == "weight") || (input == "fam") || (input == "fam weight"))
	{
		return 5;
	}
	if((input == "weapon damage") || (input == "weapon") || (input == "damage") || (input == "weapon dmg") || (input == "wpn") || (input == "wpn dmg"))
	{
		return 6;
	}
	if((input == "spell damage") || (input == "spell"))
	{
		return 7;
	}
	if((input == "nc") || (input == "non-combat") || (input == "non combat") || (input == "combat"))
	{
		return 8;
	}
	if((input == "item") || (input == "item drop") || (input == "drop"))
	{
		return 9;
	}
	if((input == "hot resistance") || (input == "hot res") || (input == "resistance") || (input == "hot"))
	{
		return 10;
	}
	if((input == "coil") || (input == "wire") || (input == "crap"))
	{
		return 11;
	}
	abort("Incorrect Community Service Quest Specified: " + input);
	return -1;
}

void prepwork() {
    print("Doing Pre-quest stuff");
    // Use astral six pack
    use(1, $item[astral six-pack]);
    
    // Pull and use items from storage
    take_storage(1, $item[Deep Dish of Legend]);
    take_storage(1, $item[Calzone of Legend]);
    take_storage(1, $item[Pizza of Legend]);
    take_storage(1, $item[Bowl of Infinite Jelly]);
    take_storage(1, $item[Borrowed Time]);

    // Go to Tootorial and use letter
    visit_url("/tutorial.php?action=toot&pwd"+ my_hash());
    use(1, $item[Letter from King Ralph XI]);
    
    // Use pork elf goodies sack
    use(1, $item[Pork Elf Goodies Sack]);
    
    // Sell all baconstone, hamethyst, porquoise
    foreach stone in $items[hamethyst, baconstone, porquoise]
    autosell(item_amount(stone), stone);
    // Use borrowed time
    use(1, $item[Borrowed Time]);
    
    
    // Perform coil wire test
    int quest = get_cs_questNum("coil");
    visit_url("council.php"); // visit council to clear the starting message
    visit_url("council.php");
    visit_url("choice.php?whichchoice=1089&option=" + quest + "&pwd=" + my_hash());
    use(1, $item[a ten-percent bonus]);

    // Buy hermit permit and acquire 11-leaf clovers
    buy(1, $item[Hermit Permit]);
    hermit(3, $item[11-leaf clover]);
    
    // Buy toy accordion
    buy(1, $item[Toy Accordion]);
    
    current_state = "Pre Stat tests";
    print("Current state: " + current_state);
}

void leveling() {
    // Buy 3 mouthwash and 1 ember jacket
    buy(3, $item[Mmm-brr! brand mouthwash]); 
    buy(1, $item[embers-only jacket]);
    
    // Open McHugeLarge duffel bag
    visit_url("inventory.php?action=skiduffel&pwd=" + my_hash());
    
    // Make Troutsers and equip
    cli_execute("make Troutsers");
    equip($item[Troutsers]);
    
    // Familiar exotic parrot
    use_familiar($familiar[exotic parrot]);
    
    // Cast spells
    buy(2, $item[Doc Galaktik's Invigorating Tonic]);
    use(2, $item[Doc Galaktik's Invigorating Tonic]);
    cli_execute("cast Elemental Saucesphere");
    cli_execute("cast Astral Shell");
    cli_execute("cast Leash of Linguini");
    
    // Wish fever from the Flavor
    cli_execute("monkeypaw wish Fever from the Flavor");
    
    
    // Busk with outfits
    equip($slot[hat], $item[Prismatic Beret]);
    equip($slot[shirt], $item[Embers-Only Jacket]);
    equip($slot[pants], $item[none]);
    cli_execute("cast Beret Busking");
    equip($slot[hat], $item[Prismatic Beret]);
    equip($slot[shirt], $item[none]);
    equip($slot[pants], $item[Troutsers]);
    cli_execute("cast Beret Busking");
    buy(1, $item[studded leather boxer shorts]);
    equip($slot[hat], $item[Prismatic Beret]);
    equip($slot[shirt], $item[Embers-Only Jacket]);
    equip($slot[pants], $item[studded leather boxer shorts]);
    cli_execute("cast Beret Busking");
    equip($slot[hat], $item[Prismatic Beret]);
    equip($slot[shirt], $item[Embers-Only Jacket]);
    equip($slot[pants], $item[Troutsers]);
    cli_execute("cast Beret Busking");
    equip($slot[hat], $item[Prismatic Beret]);
    equip($slot[shirt], $item[none]);
    equip($slot[pants], $item[Chain-Mail Monokini]);
    cli_execute("cast Beret Busking");
    
    // Allied radio boon
    cli_execute("alliedradio effect boon");
    
    // Maximize for cold res
    cli_execute("maximize cold res");
    
    // Use 3 mouthwash
    use(3, $item[Mmm-brr! brand mouthwash]);
    
    current_state = "Stat tests";
    print("Current state: " + current_state);
}

void stat_tests() {
    // Use Watermelon day
    cli_execute("skill Aug. 3rd: Watermelon Day! ");
    
    // Eat watermelon
    eat(1, $item[watermelon]);
    cli_execute("cast Aug. 16th: Roller Coaster Day!");

    // Eat legendary pizzas
    eat(1, $item[Deep Dish of Legend]);
    eat(1, $item[Calzone of Legend]);
    eat(1, $item[Pizza of Legend]);
    
    // Monorail buff
    cli_execute("monorail");
    
    // Telescope buff
    cli_execute("telescope high");
    
    // Use Relaxation day
    cli_execute("skill Aug. 15th: Relaxation Day!");
    
    // Use perfect freeze
    cli_execute("skill Perfect Freeze");
    
    // Craft perfect drink
    item perfect_drink;
    if (available_amount($item[bottle of vodka]) > 0) {
        cli_execute("make Perfect Cosmopolitan");
        perfect_drink = $item[Perfect Cosmopolitan];
    } else if (available_amount($item[bottle of whiskey]) > 0) {
        cli_execute("make Perfect Old-Fashioned");
        perfect_drink = $item[Perfect Old-Fashioned];
    } else if (available_amount($item[boxed wine]) > 0) {
        cli_execute("make Perfect Mimosa");
        perfect_drink = $item[Perfect Mimosa];
    } else if (available_amount($item[bottle of rum]) > 0) {
        cli_execute("make Perfect Dark and Stormy");
        perfect_drink = $item[Perfect Dark and Stormy];
    } else if (available_amount($item[bottle of tequila]) > 0) {
        cli_execute("make Perfect Paloma");
        perfect_drink = $item[Perfect Paloma];
    } else if (available_amount($item[bottle of gin]) > 0) {
        cli_execute("make Perfect Negroni");
        perfect_drink = $item[Perfect Negroni];
    }
    
    // Use 11 leaf clover on sleazy alley
    use(1, $item[11-leaf clover]);
    cli_execute("adventure 1 Sleazy Back Alley");
    
    // Use ode to booze thrice
    cli_execute("cast Ode to Booze");
    cli_execute("cast Ode to Booze");
    cli_execute("cast Ode to Booze");
    
    // Drink pilsners, perfect drink, and 2 distilled wine
    drink(6, $item[astral pilsner]); 
    drink(1, perfect_drink);
    drink(2, $item[distilled fortified wine]);
    
    // Wish Stabilizing Oilness and A Contender
    cli_execute("monkeypaw wish Stabilizing");
    cli_execute("monkeypaw wish A Contender");
    
    // Cast spells
    cli_execute("cast Get Big");
    cli_execute("cast Stevedave's Shanty");
    cli_execute("cast The Power Ballad of the Arrowsmith");
    
    // Make sheriff badge
    cli_execute("make sheriff badge");
    
    // Do all 3 tests using maximizer
    cli_execute("maximize HP");
    int quest = get_cs_questNum("hp");
    visit_url("council.php");
    visit_url("choice.php?whichchoice=1089&option=" + quest + "&pwd=" + my_hash());
    cli_execute("maximize muscle");
    quest = get_cs_questNum("mus");
    visit_url("council.php");
    visit_url("choice.php?whichchoice=1089&option=" + quest + "&pwd=" + my_hash());
    cli_execute("maximize mysticality");
    quest = get_cs_questNum("myst");
    visit_url("council.php");
    visit_url("choice.php?whichchoice=1089&option=" + quest + "&pwd=" + my_hash());
    cli_execute("maximize moxie");
    quest = get_cs_questNum("mox");
    visit_url("council.php");
    visit_url("choice.php?whichchoice=1089&option=" + quest + "&pwd=" + my_hash());
    
    current_state = "FamWT test";
    print("Current state: " + current_state);
}

void hot_res_test() {
    // Use Pocket Maze
    use(1, $item[Pocket Maze]);
    
    // Wish fireproof lips
    cli_execute("monkeypaw wish Fireproof Lips");
    
    // Maximize hot res
    cli_execute("maximize hot res");
    
    // Do test
    int quest = get_cs_questNum("hot res");
    visit_url("council.php");
    visit_url("choice.php?whichchoice=1089&option=" + quest + "&pwd=" + my_hash());
    
    current_state = "Weapon DMG";
    print("Current state: " + current_state);
}

void weapon_dmg() {
    // Cast spells
    cli_execute("cast Carol of the Bulls");
    cli_execute("pool 1");
    cli_execute("cast Jackasses' Symphony of Destruction");
    cli_execute("cast Tenacity of the Snapper");
    cli_execute("cast Blessing of the War Snapper");
    cli_execute("cast Bow-Legged Swagger");
    
    // Wish outer wolf using monkey paw
    cli_execute("monkeypaw wish Outer Wolf");
    
    // Maximize for weapon damage
    cli_execute("maximize weapon damage");
    
    // Do test
    int quest = get_cs_questNum("weapon damage");
    visit_url("council.php");
    visit_url("choice.php?whichchoice=1089&option=" + quest + "&pwd=" + my_hash());
    
    current_state = "Spell DMG";
    print("Current state: " + current_state);
}

void spell_dmg() {

    // Cast spells
    cli_execute("cast Carol of the Hells");
    cli_execute("pool 2");
    cli_execute("cast Jackasses' Symphony of Destruction");
    cli_execute("cast Spirit of Cayenne");
    cli_execute("cast dial it up");
    
    // Rest 1x
    equip($item[allied radio backpack]);
    equip($slot[back], $item[none]);
    equip($item[allied radio backpack]);
    cli_execute("rest");
    equip($item[allied radio backpack]);
    // Maximize for spell dmg
    cli_execute("maximize spell damage");
    
    // Do test
    int quest = get_cs_questNum("spell damage");
    visit_url("council.php");
    visit_url("choice.php?whichchoice=1089&option=" + quest + "&pwd=" + my_hash());
    
    current_state = "Item drop test";
    print("Current state: " + current_state);
}

void item_drop_test() {
    // Familiar chest mimic
    use_familiar($familiar[chest mimic]);
    
    // Cast Aug 31st: Cabernet Sauvignon Day!
    cli_execute("cast Aug. 31st");
    
    // Cast ode to booze
    cli_execute("cast Ode to Booze");
    
    // Drink cabernet sauvignon
    drink(1, $item[bottle of Cabernet Sauvignon]);
    
    // Cast lighthouse day
    cli_execute("cast Lighthouse Day");
    
    // Make oversized monocle
    cli_execute("make oversized monocle");
    
    // Use allied radio effect for intel
    cli_execute("alliedradio effect intel");
    
    // Fortune buff hagnk
    cli_execute("fortune buff hagnk");
    
    // Use bag of grain
    use(1, $item[bag of grain]);
    
    // Cast spells
    cli_execute("cast Steely-Eyed Squint");
    cli_execute("cast Fat Leon's Phat Loot Lyric");
    cli_execute("cast Leash of Linguini");
    cli_execute("cast Empathy of the Newt");
    cli_execute("cast Singer's Faithful Ocelot");
    cli_execute("cast Who's going to Pay");
    
    int quest = get_cs_questNum("item drop");
    visit_url("council.php");
    visit_url("choice.php?whichchoice=1089&option=" + quest + "&pwd=" + my_hash());

    current_state = "Noncom test";
    print("Current state: " + current_state);
}

void noncom_test() {
    // Familiar Disgeist
    use_familiar($familiar[Disgeist]);
    
    // Make and equip fake arrow
    cli_execute("make fake arrow-through-the-head");
    equip($item[fake arrow-through-the-head]);
    
    // Use shady shades
    use(1, $item[shady shades]);
    
    // Use squeaky toy rose
    use(1, $item[squeaky toy rose]);
    
    // Cast spells
    cli_execute("cast Sonata of Sneakiness");
    cli_execute("cast Smooth Movement");
    cli_execute("cast Hide from Seekers");
    
    // Swim sprints
    cli_execute("swim sprints");
    
    // Photobooth effect wild
    cli_execute("photobooth effect wild");
    
    // Maximize for noncom
    cli_execute("maximize -combat -tie");
    
    // Do test
    int quest = get_cs_questNum("nc");
    visit_url("council.php");
    visit_url("choice.php?whichchoice=1089&option=" + quest + "&pwd=" + my_hash());
    
    current_state = "Done";
    print("Current state: " + current_state);
}

void famwt_test() {
    // Cast spells
    cli_execute("cast Leash of Linguini");
    cli_execute("cast Empathy of the Newt");
    
    // Pool 1
    cli_execute("pool 1");
    
    // Maximize famwt equip
    cli_execute("maximize familiar weight");
    
    // Do test
    int quest = get_cs_questNum("familiar weight");
    visit_url("council.php");
    visit_url("choice.php?whichchoice=1089&option=" + quest + "&pwd=" + my_hash());
    
    current_state = "Hot res test";
    print("Current state: " + current_state);
}

void main(string arg) {
    if (arg != "") {
        string start = to_lower_case(arg);
        if (start == "prep" || start == "prequest") current_state = "Pre-Quest";
        else if (start == "leveling" || start == "prestats") current_state = "Pre Stat tests";
        else if (start == "stats" || start == "stattests") current_state = "Stat tests";
        else if (start == "famwt" || start == "familiar") current_state = "FamWT test";
        else if (start == "hotres" || start == "hot") current_state = "Hot res test";
        else if (start == "weapondmg" || start == "weapon") current_state = "Weapon DMG";
        else if (start == "spelldmg" || start == "spell") current_state = "Spell DMG";
        else if (start == "itemdrop" || start == "item") current_state = "Item drop test";
        else if (start == "noncom" || start == "noncombat") current_state = "Noncom test";
        else {
            print("Unknown start point: " + arg + ". Starting from beginning.");
            current_state = "Pre-Quest";
        }
    } else {
        current_state = "Pre-Quest";
    }
    while (current_state != "Done") {
        if (current_state == "Pre-Quest") prepwork();
        else if (current_state == "Pre Stat tests") leveling();
        else if (current_state == "Stat tests") stat_tests();
        else if (current_state == "Hot res test") hot_res_test();
        else if (current_state == "Weapon DMG") weapon_dmg();
        else if (current_state == "Spell DMG") spell_dmg();
        else if (current_state == "Item drop test") item_drop_test();
        else if (current_state == "Noncom test") noncom_test();
        else if (current_state == "FamWT test") famwt_test();
        else {
            print("Unknown state: " + current_state);
            break;
        }
    }
}
