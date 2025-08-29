import java.util.Scanner;

class Dispenser{

    public void prepareDrink(Drink d, Sugar s, Ice i){
        System.out.println("Preparing your drink");
        setTemp(d.type,i);
        switch (d.name){
            case "Coffee", "Tea":{
                Startflow(d.name);
                AddMilk();
                DropSugar(s.presence,s.sweetness);
                Mix();
                break;
            }

            case "Pepsi", "Coke", "Fanta": {
                Startflow(d.name);
                break;
            }

            case "Cocktail":{
                Startflow("Coke");
                Startflow("Pepsi");
                Startflow("Fanta");
                Mix();
                break;
            }

            default:{
                System.out.println("Please choose a drink which is available");
                break;
            }

        }
        System.out.println("Drink is ready");

    }

    public void setTemp(String type,Ice i){
        if(type.equals("hot")){
            System.out.println("Setting temperature to hot");
        }
        else{
            System.out.println("Setting temperature to cold");
            AddIce(i.number,i.presence);
        }
    }

    public void Startflow(String drink){
        System.out.println(drink+ " is flowing out");
    }

    public void AddMilk(){
        System.out.println("Dropping milk");
    }

    public void DropSugar(boolean sweet, String sweetness){
        if(sweet){
            System.out.println("dropping sugar");
            System.out.println("Making it "+ sweetness);
        }
        else {
            System.out.println("Not addding sugar");
        }
    }

    public void AddIce(int numberOfCubes,boolean presence){
        if(presence){
            System.out.println("Adding "+numberOfCubes + " to your drink");
        }
        else{
            System.out.println("Not adding cubes");
        }
    }

    public void Mix(){
        System.out.println("Mixing the drink");
    }
}

class Drink extends liquid {
    String name;
    String type;

    public Drink(String name,String type) {
        this.name = name;
        this.type = type;
    }
}

class Sugar extends solid{
    String sweetness;
    boolean presence;

    public Sugar(String sweetness, boolean presence) {
        this.sweetness = sweetness;
        this.presence = presence;
    }
}

class Ice extends solid {
    int number;
    boolean presence;

    public Ice(int number, boolean presence) {
        this.number = number;
        this.presence = presence;
    }
}

class solid {
    String property;
}

class liquid {
    int viscosity;
}

class DrinkOrder {
    Drink d;
    Sugar s;
    Ice i;

    public DrinkOrder(Drink d, Sugar s, Ice i){
        this.d = d;
        this.s = s;
        this.i = i;
    }
}

class Order {
    DrinkOrder[] drinkOrders;

    public Order(DrinkOrder[] drinkOrders){
        this.drinkOrders = drinkOrders;
    }
}

public class Association2 {
    public static void main(String[] args) {

        Dispenser disp = new Dispenser();
        Scanner inputScanner = new Scanner(System.in);
        Order[] orders = new Order[2];
        int index = 0;

        while(index < orders.length){
            System.out.print("Enter number of drinks in this order: ");
            int drinkCount = inputScanner.nextInt();
            inputScanner.nextLine();
            DrinkOrder[] drinkOrders = new DrinkOrder[drinkCount];

            for(int j=0;j<drinkCount;j++){
                System.out.print("Enter your Drink: ");
                String drinkName = inputScanner.nextLine();
                System.out.print("Enter your Temperature: ");
                String temperature = inputScanner.nextLine();
                Drink d = new Drink(drinkName,temperature);

                System.out.print("Do you want sugar ");
                boolean presence = inputScanner.nextBoolean();
                inputScanner.nextLine();
                System.out.print("Enter your preferred sweetness: ");
                String sweetness = inputScanner.nextLine();
                Sugar s = new Sugar(sweetness,presence);

                Ice i;
                if(temperature.equals("cold")){
                    System.out.print("Enter number of ice cubes ");
                    int numberOfCubes = inputScanner.nextInt();
                    inputScanner.nextLine();
                    i = new Ice(numberOfCubes,true);
                }
                else{
                    i = new Ice(0,false);
                }

                drinkOrders[j] = new DrinkOrder(d,s,i);
                disp.prepareDrink(d,s,i);
            }

            orders[index] = new Order(drinkOrders);
            index++;
        }

        System.out.println("All Orders:");
        for(Order o : orders){
            for(DrinkOrder dr : o.drinkOrders){
                System.out.println("Drink: " + dr.d.name + " | Temp: " + dr.d.type + " | Sugar: " + dr.s.presence + " | Sweetness: " + dr.s.sweetness + " | Ice Cubes: " + dr.i.number);
            }
        }
    }
}
