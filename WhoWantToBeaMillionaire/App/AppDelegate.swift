//
//  AppDelegate.swift
//  WhoWantToBeaMillionaire
//
//  Created by Кирилл Тарасов on 30.08.2021.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if Game.shared.questions.count <= 0 {
            Game.shared.questions = [
                
                Question(question: "Кто был первым военным министром Российской империи?",
                         answers: [
                         "Аракчеев",
                        "Барклай-де-Толли",
                        "Вязмитинов",
                        "Коновницын"
                         ],
                         correctAnswer: 3,
                         prize: 1000
                ),
                Question(question: "Реки с каким названием нет на территории России?",
                         answers: [
                            "Спина",
                            "Уста",
                            "Палец",
                            "Шея"

                         ],
                         correctAnswer: 1,
                         prize: 5000
                ),
                Question(question: "Что Шекспир назвал «вкуснейшим из блюд в земном пиру»?",
                         answers: [
                            "Опьянение",
                            "Любовь",
                            "Уединение",
                            "Сон"
                         ],
                         correctAnswer: 4,
                         prize: 10000
                ),
                Question(question: "Кто из этих философов в 1864 году написал музыку на стихи А. С. Пушкина «Заклинание» и «Зимний вечер»?",
                         answers: [
                            "Юнг",
                            "Ницше",
                            "Шопенгауэр",
                            "Гегель"
                         ],
                         correctAnswer: 2,
                         prize: 100000
                ),
                Question(question: "С какой фигуры начинаются соревнования по городошному спорту?",
                         answers: [
                            "Часовые",
                            "Артиллерия",
                            "Пушка",
                            "Пулемётное гнездо"
                         ], correctAnswer: 3,
                         prize: 200000
                ),
                Question(question: "Сколько раз в сутки подзаводят куранты Спасской башни Кремля?",
                         answers: [
                            "Один",
                            "Два",
                            "Три",
                            "Четыре",
                         ], correctAnswer: 2,
                         prize: 500000
                ),
                Question(question: "Как назвали первую кимберлитовую трубку, открытую Ларисой Попугаевой 21 августа 1954 года?",
                         answers: [
                            "«Советская»",
                            "«Зарница»",
                            "«Удачная»",
                            "«Мир»"
                         ],
                         correctAnswer: 2,
                         prize: 1000000
                )
            ]
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentCloudKitContainer(name: "WhoWantToBeaMillionaire")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

