//
//  ExerciseViewController.swift
//  homeWorkout
//
//  Created by Eldor Makkambaev on 21.04.2018.
//  Copyright © 2018 Eldor Makkambaev. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController, UITableViewDataSource {
    
    var trainingImage_image = UIImage()
    var alertTitle = String()
    var alertMessage = String()
    var trainingName_text = String()
    var isHidden = true
    
    let maxHeaderHeight: CGFloat = 153;
    let minHeaderHeight: CGFloat = 0;

    var previousScrollOffset: CGFloat = 0
    
    var dictionary = ["Вращение руками" : "Qwertyuiop"]
    
    @IBOutlet weak var blurredView: UIVisualEffectView!
    @IBOutlet weak var popView: UIView!
    @IBOutlet weak var alert_title: UILabel!
    @IBOutlet weak var alert_message: UITextView!
    
    
    @IBOutlet weak var training_image: UIImageView!
    @IBOutlet weak var table_view: UITableView!
    
    var exercises :[Exercise] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exCell", for: indexPath) as! ExerciseTableViewCell
        
        cell.textLabel?.text = exercises[indexPath.row].exerciseNm
        cell.detailTextLabel?.text = exercises[indexPath.row].approachLbl
//        alertTitle = cell.exName.text!
        // Configure the cell...
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let moveCell = exercises[sourceIndexPath.item]
        exercises.remove(at: sourceIndexPath.item)
        exercises.insert(moveCell, at: destinationIndexPath.item)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            exercises.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func edit_action(_ sender: UIBarButtonItem) {
        self.table_view.isEditing = !self.table_view.isEditing
        sender.title = (self.table_view.isEditing) ? "Done" : "Edit"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        
        //getting the current cell from the index path
        let currentCell = tableView.cellForRow(at: indexPath!)! as UITableViewCell
        
        //getting the text of that cell
        alert_title.text = currentCell.textLabel!.text!
        
        exIntruction()
//        alertTitle = (cell.textLabel?.text)!
        
            UIView.animate(withDuration: 0.3) {
                self.blurredView.alpha = 1
                self.popView.transform = CGAffineTransform.identity
           
        }

    }
    
    
    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    
    @IBAction func videoInstructor(_ sender: UIButton) {
        if let url = URL(string: "https://youtu.be/Cilm0WNRdCo") {
            UIApplication.shared.open(url, options: [:])
        }
        
    
        
    }
    
    @IBAction func close_alertBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.blurredView.alpha = 0
            self.popView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.alert_message.text = ""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = trainingName_text
        
        exerciseName()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.headerHeightConstraint.constant = self.maxHeaderHeight
        updateHeader()
    }
    
    func exIntruction(){
        switch alert_title.text! {
        case "Вращение руками":
            alert_message.insertText("Встаньте на пол, втянув прямые руки вперед на высоте плеч. \n \nПоднимите руки над головой, затем вернитесь в исходное положение. \n \nПовторите упражнение.")
        case "Растяжка ромбовидных мышц":
            alert_message.insertText("Встаньте ровно, ноги на ширине плеч. \n \nПоднимите руки параллельно земле, согните локти. Отведите локти назад и сведите лопатки. \n \nПовторите упражнение.")
        case "Подъем рук в сторону":
            alert_message.insertText("Встаньте ровно, ноги на ширине плеч. \n \nПоднимите руки в стороны до уровня плеч, а затем отпустите. \n \nПовторите упражнение.")
        case "Растяжка в сторону на полу (влево)":
            alert_message.insertText("Ложитесь на правый бок. Правое колено слегла согнуто и выдвинуто вперед, левая нога вытянута назад за правую ногу. \n \nВытяните левую руку на головой и мягко потяните за левое запятые вверх, чтобы растянуть левую сторону тела. \n \nОставайтесь в этом положении несколько секунд.")
        case "Растяжка в сторону на полу (вправо)":
            alert_message.insertText("Ложитесь на левый бок. Левое колено слегла согнуто и выдвинуто вперед, правая нога вытянута назад за правую ногу. \n \nВытяните правую руку на головой и мягко потяните за правое запятые вверх, чтобы растянуть правую сторону тела. \n Оставайтесь в этом положении несколько секунд.")
        case "Ножницы руками":
            alert_message.insertText("Встаньте ровно, ноги на ширине плеч. \n \nВытяните руки перед собой на уровне плеч, так, чтобы одна была чуть выше другой, а вместе они составляли букву «Х». Затем разведите руки в стороны. \n \nПовторите упражнение так, чтобы теперь выше была другая рука.")
        case "Подъем рук в сторону":
            alert_message.insertText("Встаньте ровно, ноги на ширине плеч. \n \nПоднимите руки в стороны до уровня плеч, а затем опустите. \n\nПовторите упражнение.")
        case "Поза кошки - поза коровы":
            alert_message.insertText("Начальное положение - на четвереньках, колени под ягодицами, ладони прямо под плечами. \n \nДелая вдох, опустите живот, разверните плечи и опустите голову. \n\nПовторите упражнение.")
        case "Полуотжимание на трицепсы":
            alert_message.insertText("Ложитесь на живот, поставьте ладони на пол прямо под плечами, локти согнуты. \n \nМедленно поднимите грудь от пола, затем вернитесь в исходное положение. \n \nПовторите упражнение.")
        case "Напряжение ромбовидных мышц сидя":
            alert_message.insertText("Садитесь на пол, колени согнуты. Слегка отклоните верхнюю часть корпуса назад. \n \nВытяните руки перед собой, а затем отведите локти назад так, чтобы они оказались согнуты под углом 90 градусов, и сведите лопатки. \n \nПовторите упражнение.")
        case "Отжимание с упором на колени":
            alert_message.insertText("Исходное положение - обычное положение для отжиманий, но с упором на колени и приподнятыми стопами. Выполняйте отжимание.")
            
        case "Поза ребёнка":
            alert_message.insertText("Начальное положение - с коленями и ладонями на полу. \n \nСлегка вытяните руки вперед, раздвиньте колени и сведите вместе ступни. Вдохните, затем выдохните и подайте корпус назад. Постарайтесь сделать так, чтобы ягодицы касались пяток. \n \nРасслабьте локти, коснитесь лбом пола и постарайтесь опустить грудь к полу. Оставайтесь в этом положении.")
        case "Прыжки":
            alert_message.insertText("Ноги вместе, руки вдоль корпуса. Прыжком разведите ноги, одновременно поднимая руки в стороны до положения над головой. Прыжком верните в исходное положение. \n \nПовторите нужное количество раз. Упражнение нагружает все  крупные группы мышц, укрепляя все тело.")
        case "Приседания":
            alert_message.insertText("Ноги на ширине плеч, руки вытянуты перед собой. Опускайтесь до тех пор, пока бедра не будут параллельны полу. \n \nПри выполнении упражнения колени должны быть направлены туда же, куда направлены носки ног. Вернитесь в исходное положение.")
        case "Подъем ноги лежа на боку (для левой ноги)":
            alert_message.insertText("Лягте на бок, подложив вправо руку под голову. \n \nПоднимите верхнюю ногу и вернитесь в исходное положение. \n \nВыполнив упражнение несколько раз, перевернитесь на другой бок. \n \nСовет: старайтесь поднимать и опускать прямую ногу. \n \nМышцы: ягодичные.")
        case "Подъем ноги лежа на боку (для правой ноги)":
            alert_message.insertText("Лягте на бок, подложив влево руку под голову. \n \nПоднимите верхнюю ногу и вернитесь в исходное положение. \n \nВыполнив упражнение несколько раз, перевернитесь на другой бок. \n \nСовет: старайтесь поднимать и опускать прямую ногу. \n \nМышцы: ягодичные.")
        case "Выпад назад":
            alert_message.insertText("Встаньте ровно, ноги на ширине плеч, руки на бедрах. \n \nСделайте большой шаг назад правой ногой, опуская всем телом так, чтобы левое бедро было параллельно полу. \n \nВернитесь в исходное положение и повторите упражнение в другую сторону.")
        case "Ослик лягается влево":
            alert_message.insertText("И.п. стоя на четвереньках колени строго под бедрами, руки под плечами. \n \nВытяните левую ногу в сторону, максимально развернув колено вверх.")
        case "Ослик лягается вправо":
            alert_message.insertText("И.п. стоя на четвереньках колени строго под бедрами, руки под плечами. \n \nВытяните правую ногу в сторону, максимально развернув колено вверх.")
        case "Растяжка четырехглавой мышцы у стены (левая)":
            alert_message.insertText("Встаньте ровно, правая рука на стене. Согните левую ногу в колене и обхватите щиколотку или ступню левой рукой. Подтяните левую голень к левому бедру. Оставайтесь в этом положении.")
        case "Растяжка четырехглавой мышцы у стены (правая)":
            alert_message.insertText("Встаньте ровно, левая рука на стене. Согните правую ногу в колене и обхватите щиколотку или ступню правой рукой. Подтяните правую голень к правому бедру. Оставайтесь в этом положении.")
        case "Отжимание с упором на впереди":
            alert_message.insertText("Исходное положение - обычное положений, но с руками на стуле или скамье. \n \nВыполняйте отжимания силой рук. Не забывайте держать корпус прямо.")
        case "Отжимание от пола":
            alert_message.insertText("Поднятие и опускание тела с помощью рук, держите тело прямо. \n \nЭто упражнение прорабатывает мышцы груди, плеч, трицепсы, спину и ноги.")
        case "Отжимание с широким упором":
            alert_message.insertText("Исходное положение - обычное положение для отжиманий, но с упором шире плеч. \n \nВыполняйте отжимания. Не забывайте держать корпус прямо.")
        case "Отжимание на четвереньках":
            alert_message.insertText("Исходное положение - на четвереньках, колени под ягодицами, руки прямо под плечами. \n \nСогните руки в локтях и выполните отжимание. Вернитесь в исходное положение и повторите упражнение.")
        case "Отжимание по-индийски":
            alert_message.insertText("Исходное положение - руки и ноги касаются пола, бедра подняты вверх. Положение напоминает перевернутую букву «V». \n \nСогните руки в локтях, опуская тело к полу. Когда тело будет близко к полу, поднимите корпус как можно выше. \n \nЗатем вернитесь в исходное положение и повторите упражнение.")
        case "Растяжка кобра":
            alert_message.insertText("Ложитесь на живот. Руки согнуты в локтях, ладони на полу под плечами. \n \nПоднимите грудь как можно выше над полом. Оставайтесь в этом положении несколько секунд.")
        case "Грудь":
            alert_message.insertText("Встаньте в дверной проем в положение выпада, положив предплечья по сторонам на дверной косяк, локти чуть ниже плеч. Затем медленно подайте грудь вперед. \n \nОставайтесь в этом положении 30-40 секунд. Затем медленно отведите грудь назад в исходное положение, опустите руки и сделайте несколько вращений плечами назад.")
        case "Упражнение для пресса":
            alert_message.insertText("Лягте на спину, ногу согнуты в коленях, руки вытянуты вперед. Приподнимите корпус. \n \nЗадержитесь в верхнем положении на несколько секунд и медленно вернитесь в исходное положение.")
        case "Качели":
            alert_message.insertText("Сядьте на пол, согните колени. Ноги слегка приподнять, корпус отклонить назад. \n \nСоедините руки перед грудью и делайте повороты корпуса из стороны в сторону.")
        case "Альпинист":
            alert_message.insertText("Примите упор лежа. Подтяните правое колено к груди, выпрыгните и поменяйте в воздухе ноги - левую вперед, правую назад. \n \nУкрепляет многие группы мышц, полезно для сердечно-сосудистой системы.")
        case "Боковые наклоны к стопам":
            alert_message.insertText("Ложитесь на спину, ноги согните в коленях, руки лежат вдоль корпуса. \n \nПриподнимите корпус от пола и поочередно касайтесь каждой пятки пальцами той же руки.")
        case "Поднятие ног лежа на спине":
            alert_message.insertText("Лягте на спину и положите руки под бедра для поддержки. \nПоднимите прямые ноги вверх до образования прямого угла с полом. \n \nМедленно опустите ноги вниз и повторите упражнение.")
        case "Планка":
            alert_message.insertText(" Удерживайте положение «упор лежа» на локтях и пальцах ног. \n \nПытайтесь сохранить это положение с прямой спиной. \n \nУпражнение укрепляет мышцы живота, спины и плеч.")
        case "Скручивания в пояснице лежа на полу (влево)":
            alert_message.insertText("Ложитесь на спину, ноги вытянуты. \n \nПоднимите левую ногу и потяните ее за колено правой рукой в правую сторону; левая рука при этом вытянута в сторону на полу.")
        case "Скручивания в пояснице лежа на полу (вправо)":
            alert_message.insertText("Поднимите правую ногу и потяните ее за колено левой рукой в левую сторону, правая рука при этом вытянута в сторону на полу.")
        case "Обратные отжимание от стула":
            alert_message.insertText("В положении спиной к стулу обопритесь руками о переднюю часть стула, при этом отодвинув бедра и ноги. \n \nДержа спину близко к стулу, согните локти до угла 90 градусов. Это отличное упражнение для трицепсов.")
        case "Махи руками по часовой стрелке":
            alert_message.insertText("Встаньте ровно, руки вытянуты в стороны на уровне плеч. /n /nБыстро вращайте руками от плеч по часовой стрелке.")
        case "Махи руками против часовой стрелке":
            alert_message.insertText("Встаньте ровно, руки вытянуты в стороны на уровне плеч. \n \nБыстро вращайте руками от плеч против часовой стрелке.")
        case "Отжимание со сведенными ладонями":
            alert_message.insertText("Исходное положение - на четвереньках, колени под ягодицами, руки под плечами. \n \nСоедините большие и указательные пальцы рук под грудью в форме алмаза и выполняйте отжимания. \n \nНе забывайте держать корпус прямо.")
        case "Двежения вверх-вниз сведенными локтями":
            alert_message.insertText("Сведите предплечья, сцепите ладони в замок и согните руки на высоте плеч наподобие большой буквы L. Затем поднимайте и опускайте локти")
        case "Подъем ноги бицепсом левой руки":
            alert_message.insertText("Встаньте у стены. Поднимите правую ногу, наклонитесь вперед и обхватите правую лодыжку снизу левой рукой. \n \nПоднимите лодыжку как можно выше к плечу, а затем опустите. Повторите упражнение")
        case "Подъем ноги бицепсом правой руки":
            alert_message.insertText("Встаньте у стены. Поднимите левую ногу, наклонитесь вперед и обхватите левую лодыжку снизу правой рукой. \n \nПоднимите лодыжку: как можно выше к плечу, а затем опустите. Повторите упражнение")
        case "Диагональная планка":
            alert_message.insertText("Исходное положение - планка на прямых руках. Поднимите правую руку и левую ногу параллельно полу. \n \nВернитесь в исходное положение и повторите на другу сторону")
        case "Бокс":
            alert_message.insertText("Встаньте, поставив ноги на ширине плеч и слегка согнув их в коленях. Согните руки в локтях и сожмите кулаки на уровне лица. \n \nВыпрямите одну руку вперед ладонью вниз. Верните руку в исходное положение и повторите другой рукой.")
        case "Гусеница":
            alert_message.insertText("Ноги на ширине плеч. Согните корпус и идите на руках вперед так далеко, как сможете, затем вернитесь на руках обратно. Повторите упражнение.")
        case "Отжимание от стены":
            alert_message.insertText("Встаньте перед стеной на расстоянии широкого шага. Вытяните руки прямо перед собой и упритесь о стену. \n \nМедленно согните руки в локтях, приближая корпус к стене. Отожмитесь и повторите упражнение.")
        case "Растяжка левого трицепса":
            alert_message.insertText("Поднимите левую руку вверх и согните ее в локте так, чтобы ладонь легла на спину. Возитесь правой рукой за левый локоть и мягко потяните. Оставайтесь в этом положении несколько секунд.")
        case "Растяжка правого трицепса":
            alert_message.insertText("Поднимите правую руку вверх и согните ее в локте так, чтобы ладонь легла на спину. Возитесь левой рукой за правый локоть и мягко потяните. Оставайтесь в этом положении несколько секунд.")
        case "Растяжка бицепса стоя (левая рука)":
            alert_message.insertText("Встаньте у стены, левая рука близко стене. Вытяните левую руку и положите левую ладонь на стену, а затем медленно поверните корпус вправо.")
        case "Растяжка бицепса стоя (правая рука)":
            alert_message.insertText("Встаньте у стены, правая рука близко стене. Вытяните правую руку и положите правую ладонь на стену, а затем медленно поверните корпус влево.")
        case "Прыжки в стороны":
            alert_message.insertText("Встаньте ровно, руки перед собой, и делайте прыжки в стороны.")
        case "Растяжка 'левое колено к груди'":
            alert_message.insertText("Ложитесь спиной на пол, ноги вытянуты. Поднимите левое колено и схватите его обеими руками. \n \nПотяните левое колено как можно ближе к груди, прямая правая нога при этом должно лежать на полу. \n \nОставайтесь в этом положении несколько секунд.")
        case "Растяжка 'правое колено к груди'":
            alert_message.insertText("Ложитесь спиной на пол, ноги вытянуты. Поднимите правое колено и схватите его обеими руками. \n \nПотяните правое колено как можно ближе к груди, прямая левая нога при этом должно лежать на полу. \n \nОставайтесь в этом положении несколько секунд.")
        case "Подъёмы на носки у стены":
            alert_message.insertText("Встаньте ровно, ноги на ширине плеч, руки на стене. \n \nПоднимите пятки и встаньте не носки. Затем опустите пятки. \n \nПовторите упражнение.")
        case "Сумо-подъёмы на носки у стены":
            alert_message.insertText("Встаньте ровно, ноги чуть шире плеч, руки на стене. \n \nОпускайте до тех пор, пока бедра не станут параллельны полу. Поднимайте и опускайте пятки.")
        case "Растяжка левой икры":
            alert_message.insertText("Встаньте к стене и сделайте большой шаг назад. Сделайте шаг вперед правой ногой и положите ладони на стену на уровне плеч. \n \nЛевая нога должна быть прямой. Почувствуйте, как тянется левая икроножная мышца. Оставайтесь в этом положении несколько секунд.")
        case "Растяжка правой икры":
            alert_message.insertText("Встаньте к стене и сделайте большой шаг назад. Сделайте шаг вперед левой ногой и положите ладони на стену на уровне плеч. \n \nПравая нога должна быть прямой. Почувствуйте, как тянется правая икроножная мышца. Оставайтесь в этом положении несколько секунд.")
            
        default:
            break
        }
    }
    
    
    
    func exerciseName(){
        switch trainingName_text {
        case "ВСЁ ТЕЛО":
            training_image.image = #imageLiteral(resourceName: "vse telo")
            exercises.append(Exercise("Вращение руками", "00:16"))
            exercises.append(Exercise("Растяжка ромбовидных мышц", "х 14"))
            exercises.append(Exercise("Подъем рук в сторону", "00:16"))
            exercises.append(Exercise("Отжимание с упором на колени", "х 14"))
            exercises.append(Exercise("Растяжка в сторону на полу (влево)", "00:30"))
            exercises.append(Exercise("Растяжка в сторону на полу (вправо)", "00:30"))
            exercises.append(Exercise("Ножницы руками", "00:30"))
            exercises.append(Exercise("Растяжка ромбовидных мышц", "х 12"))
            exercises.append(Exercise("Подъем рук в сторону", "00:14"))
            exercises.append(Exercise("Отжимание с упором на колени", "х 12"))
            exercises.append(Exercise("Поза кошки - поза коровы", "00:30"))
            exercises.append(Exercise("Полуотжимание на трицепсы", "х 14"))
            exercises.append(Exercise("Напряжение ромбовидных мышц сидя", "х 12"))
            exercises.append(Exercise("Полуотжимание на трицепсы", "х 14"))
            exercises.append(Exercise("Напряжение ромбовидных мышц сидя", "х 12"))
            exercises.append(Exercise("Поза ребёнка", "00:30"))
            
        case "НИЖНЯЯ ЧАСТЬ ТЕЛО":
            
            training_image.image = #imageLiteral(resourceName: "nizhnaya chast telo")
            exercises.append(Exercise("Прыжки", "х 30"))
            exercises.append(Exercise("Приседания", "х 12"))
            exercises.append(Exercise("Подъем ноги лежа на боку (для левой ноги)", "х 12"))
            exercises.append(Exercise("Подъем ноги лежа на боку (для правой ноги)", "х 12"))
            exercises.append(Exercise("Подъем ноги лежа на боку (для левой ноги)", "х 10"))
            exercises.append(Exercise("Подъем ноги лежа на боку (для правой ноги)", "х 10"))
            exercises.append(Exercise("Приседания", "х 10"))
            exercises.append(Exercise("Выпад назад", "х 12"))
            exercises.append(Exercise("Ослик лягается влево", "х 12"))
            exercises.append(Exercise("Ослик лягается вправо", "х 12"))
            exercises.append(Exercise("Ослик лягается влево", "х 10"))
            exercises.append(Exercise("Ослик лягается вправо", "х 10"))
            exercises.append(Exercise("Растяжка четырехглавой мышцы у стены (левая)", "х 12"))
            exercises.append(Exercise("Растяжка четырехглавой мышцы у стены (правая)", "х 12"))
            exercises.append(Exercise("Растяжка 'левое колено к груди'", "00:30"))
            exercises.append(Exercise("Растяжка 'правое колено к груди'", "00:30"))
            
        case "ГРУДЬ":
            
            training_image.image = #imageLiteral(resourceName: "grud")
            exercises.append(Exercise("Прыжки", "х 30"))
            exercises.append(Exercise("Отжимание с упором на впереди", "х 16"))
            exercises.append(Exercise("Отжимание с упором на колени", "х 12"))
            exercises.append(Exercise("Отжимание от пола", "х 10"))
            exercises.append(Exercise("Отжимание с широким упором", "х 10"))
            exercises.append(Exercise("Отжимание с упором на впереди", "х 12"))
            exercises.append(Exercise("Отжимание на четвереньках", "х 12"))
            exercises.append(Exercise("Отжимание с широким упором", "х 10"))
            exercises.append(Exercise("Отжимание по-индийски", "х 10"))
            exercises.append(Exercise("Растяжка кобра", "00:20"))
            exercises.append(Exercise("Грудь", "00:20"))
            
        case "ПРЕСС":
            
            training_image.image = #imageLiteral(resourceName: "press")
            exercises.append(Exercise("Прыжки", "х 30"))
            exercises.append(Exercise("Упражнение для пресса", "х 16"))
            exercises.append(Exercise("Качели", "х 20"))
            exercises.append(Exercise("Альпинист", "х 16"))
            exercises.append(Exercise("Боковые наклоны к стопам", "х 20"))
            exercises.append(Exercise("Поднятие ног лежа на спине", "х 16"))
            exercises.append(Exercise("Планка", "00:20"))
            exercises.append(Exercise("Прыжки", "х 30"))
            exercises.append(Exercise("Упражнение для пресса", "х 12"))
            exercises.append(Exercise("Качели", "х 32"))
            exercises.append(Exercise("Альпинист", "х 12"))
            exercises.append(Exercise("Боковые наклоны к стопам", "х 20"))
            exercises.append(Exercise("Поднятие ног лежа на спине", "х 14"))
            exercises.append(Exercise("Планка", "00:20"))
            exercises.append(Exercise("Растжка кобра", "00:20"))
            exercises.append(Exercise("Скручивания в пояснице лежа на полу (влево)", "00:30"))
            exercises.append(Exercise("Скручивания в пояснице лежа на полу (вправо)", "00:30"))
            
        case "РУКИ":
            
            training_image.image = #imageLiteral(resourceName: "ruki")
            exercises.append(Exercise("Вращение руками", "00:30"))
            exercises.append(Exercise("Подъем рук в сторону", "00:30"))
            exercises.append(Exercise("Обратные отжимание от стула", "х 10"))
            exercises.append(Exercise("Махи руками по часовой стрелке", "00:30"))
            exercises.append(Exercise("Махи руками против часовой стрелке", "00:30"))
            exercises.append(Exercise("Отжимание со сведенными ладонями", "х 6"))
            exercises.append(Exercise("Прыжки", "х 30"))
            exercises.append(Exercise("Двежения вверх-вниз сведенными локтями", "х 15"))
            exercises.append(Exercise("Подъем ноги бицепсом левой руки", "х 8"))
            exercises.append(Exercise("Подъем ноги бицепсом правой руки", "х 8"))
            exercises.append(Exercise("Диагоналная планка", "х 10"))
            exercises.append(Exercise("Поднятие ног лежа на спине", "х 14"))
            exercises.append(Exercise("Бокс", "00:30"))
            exercises.append(Exercise("Отжимание от пола", "х 10"))
            exercises.append(Exercise("Гусеница", "х 8"))
            exercises.append(Exercise("Отжимание от стены", "х 12"))
            exercises.append(Exercise("Растяжка левого трицепса", "00:30"))
            exercises.append(Exercise("Растяжка правого трицепса", "00:30"))
            exercises.append(Exercise("Растяжка бицепса стоя (левая рука)", "00:30"))
            exercises.append(Exercise("Растяжка бицепса стоя (правая рука)", "х 12"))
            
        case "ПЛЕЧИ И СПИНА":
            
            training_image.image = #imageLiteral(resourceName: "plechi i spina")
            exercises.append(Exercise("Прыжки", "х 30"))
            exercises.append(Exercise("Вращение руками", "00:16"))
            exercises.append(Exercise("Растяжка ромбовидных мышц", "х 14"))
            exercises.append(Exercise("Подъем рук в сторону", "00:16"))
            exercises.append(Exercise("Отжимание с упором на колени", "х 14"))
            exercises.append(Exercise("Растяжка в сторону на полу (вправо)", "00:30"))
            exercises.append(Exercise("Растяжка в сторону на полу (влево)", "00:30"))
            exercises.append(Exercise("Ножницы руками", "00:30"))
            exercises.append(Exercise("Растяжка ромбовидных мышц", "х 12"))
            exercises.append(Exercise("Подъем рук в сторону", "00:14"))
            exercises.append(Exercise("Отжимание с упором на колени", "х 12"))
            exercises.append(Exercise("Поза кошки - поза коровы", "00:30"))
            exercises.append(Exercise("Полуотжимание на трицепсы", "х 14"))
            exercises.append(Exercise("Напряжение ромбовидных мышц сидя", "х 12"))
            exercises.append(Exercise("Полуотжимание на трицепсы", "х 14"))
            exercises.append(Exercise("Напряжение ромбовидных мышц сидя", "х 12"))
            exercises.append(Exercise("Поза ребёнка", "00:30"))
            
        case "НОГИ":
            
            training_image.image = #imageLiteral(resourceName: "nog")
            exercises.append(Exercise("Прыжки в стороны", "00:30"))
            exercises.append(Exercise("Приседания", "х 12"))
            exercises.append(Exercise("Приседания", "х 12"))
            exercises.append(Exercise("Подъем ноги лежа на боку (для левой ноги)", "х 12"))
            exercises.append(Exercise("Подъем ноги лежа на боку (для правой ноги)", "х 12"))
            exercises.append(Exercise("Подъем ноги лежа на боку (для левой ноги)", "х 12"))
            exercises.append(Exercise("Подъем ноги лежа на боку (для правой ноги)", "х 12"))
            exercises.append(Exercise("Выпад назад", "х 14"))
            exercises.append(Exercise("Выпад назад", "х 14"))
            exercises.append(Exercise("Ослик лягается влево", "х 15"))
            exercises.append(Exercise("Ослик лягается вправо", "х 15"))
            exercises.append(Exercise("Ослик лягается влево", "х 15"))
            exercises.append(Exercise("Ослик лягается вправо", "х 15"))
            exercises.append(Exercise("Растяжка четырехглавой мышцы у стены (левая)", "00:30"))
            exercises.append(Exercise("Растяжка четырехглавой мышцы у стены (правая)", "00:30"))
            exercises.append(Exercise("Растяжка 'левое колено к груди'", "00:30"))
            exercises.append(Exercise("Растяжка 'правое колено к груди'", "00:30"))
            exercises.append(Exercise("Подъёмы на носки у стены", "х 12"))
            exercises.append(Exercise("Подъёмы на носки у стены", "х 12"))
            exercises.append(Exercise("Сумо-подъёмы на носки у стены", "х 12"))
            exercises.append(Exercise("Сумо-подъёмы на носки у стены", "х 12"))
            exercises.append(Exercise("Растяжка левой икры", "00:30"))
            exercises.append(Exercise("Растяжка правой икры", "00:30"))
            
            
        default:
            break
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ExerciseViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollDiff = scrollView.contentOffset.y - self.previousScrollOffset
        
        let absoluteTop: CGFloat = 0;
        let absoluteBottom: CGFloat = scrollView.contentSize.height - scrollView.frame.size.height;
        
        let isScrollingDown = scrollDiff > 0 && scrollView.contentOffset.y > absoluteTop
        let isScrollingUp = scrollDiff < 0 && scrollView.contentOffset.y < absoluteBottom
        
        if canAnimateHeader(scrollView) {
            
            // Calculate new header height
            var newHeight = self.headerHeightConstraint.constant
            if isScrollingDown {
                newHeight = max(self.minHeaderHeight, self.headerHeightConstraint.constant - abs(scrollDiff))
            } else if isScrollingUp {
                newHeight = min(self.maxHeaderHeight, self.headerHeightConstraint.constant + abs(scrollDiff))
            }
            
            // Header needs to animate
            if newHeight != self.headerHeightConstraint.constant {
                self.headerHeightConstraint.constant = newHeight
                self.updateHeader()
                self.setScrollPosition(self.previousScrollOffset)
            }
            
            self.previousScrollOffset = scrollView.contentOffset.y
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDidStopScrolling()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            self.scrollViewDidStopScrolling()
        }
    }
    
    func scrollViewDidStopScrolling() {
        let range = self.maxHeaderHeight - self.minHeaderHeight
        let midPoint = self.minHeaderHeight + (range / 2)
        
        if self.headerHeightConstraint.constant > midPoint {
            self.expandHeader()
        } else {
            self.collapseHeader()
        }
    }
    
    func canAnimateHeader(_ scrollView: UIScrollView) -> Bool {
        // Calculate the size of the scrollView when header is collapsed
        let scrollViewMaxHeight = scrollView.frame.height + self.headerHeightConstraint.constant - minHeaderHeight
        
        // Make sure that when header is collapsed, there is still room to scroll
        return scrollView.contentSize.height > scrollViewMaxHeight
    }
    
    func collapseHeader() {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.2, animations: {
            self.headerHeightConstraint.constant = self.minHeaderHeight
            self.updateHeader()
            self.view.layoutIfNeeded()
        })
    }
    
    func expandHeader() {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.2, animations: {
            self.headerHeightConstraint.constant = self.maxHeaderHeight
            self.updateHeader()
            self.view.layoutIfNeeded()
        })
    }
    
    func setScrollPosition(_ position: CGFloat) {
        self.table_view.contentOffset = CGPoint(x: self.table_view.contentOffset.x, y: position)
//        self.tableView.contentOffset = CGPoint(x: self.tableView.contentOffset.x, y: position)
    }
    
    func updateHeader() {
        let range = self.maxHeaderHeight - self.minHeaderHeight
        let openAmount = self.headerHeightConstraint.constant - self.minHeaderHeight
        let percentage = openAmount / range
        self.navigationItem.title = self.trainingName_text
        self.training_image.alpha = percentage
    }
}
