// MARK: Imports

import Danger
import DangerSwiftCoverage
import DangerXCodeSummary
import Foundation

// MARK: Validate

// Validator.shared.validate()

// MARK: Lint

SwiftLint.lint(configFile: ".swiftlint.yml")

// MARK: Validation rules

// internal class Validator {

//     // MARK: Lifecycle

//     private init() {}
//     internal static let shared = Validator()
//     private var danger = Danger()

//     // MARK: Properties

//     private lazy var additions = danger.github.pullRequest.additions!
//     private lazy var deletions = danger.github.pullRequest.deletions!
//     private lazy var changedFiles = danger.github.pullRequest.changedFiles!

//     private lazy var modified = danger.git.modifiedFiles
//     private lazy var editedFiles = modified + danger.git.createdFiles
//     private lazy var prTitle = danger.github.pullRequest.title

//     private lazy var branchHeadName = danger.github.pullRequest.head.ref
//     private lazy var branchBaseName = danger.github.pullRequest.base.ref

//     // Methods

//     internal func validate() {
//         checkSize()
//         checkDescription()
//         checkReleases()
//         checkUnitTest()
//         checkTitle()
//         checkAssignee()
//         checkModifiedFiles()
//         checkFails()

//         logResume()
//     }
// }

// internal class DescriptionValidator {

//     // MARK: Lifecycle

//     private init() {}
//     internal static let shared = DescriptionValidator()
//     private var danger = Danger()

//     // MARK: Properties

//     private lazy var body = danger.github.pullRequest.body ?? ""

//     // Methods

//     internal func validate() {
//         let message = "PR não tem descrição. Você deve fornecer uma descrição das alterações feitas."

//         guard !body.isEmpty else {
//             return fail(message)
//         }
//     }
// }

// internal class ReleaseValidator {

//     // MARK: Lifecycle

//     private init() {}
//     internal static let shared = ReleaseValidator()
//     private var danger = Danger()

//     // Methods

//     internal func validate() {
//         checkReleaseVersion()
//     }
// }

// internal class UnitTestValidator { 

//     // MARK: Lifecycle

//     private init() {}
//     internal static let shared = UnitTestValidator()
//     private var danger = Danger()

//     // Methods

//     internal func validate() {
//         checkUnitTestSummary()
//         checkUnitTestCoverage()
//     }
// }

// // MARK: Validator Methods

// fileprivate extension Validator {

//     func checkSize() {
//         if (additions + deletions) > ValidationRules.bigPRThreshold {
//             let message = 
//             """
//             O tamanho do PR parece relativamente grande. \
//             Se possível, no futuro se o PR contiver várias alterações, divida cada uma em um PR separado. \
//             Isto ajuda em uma revisão mais rápida e fácil.
//             """
//             warn(message)
//         }
//     }

//     func checkDescription() {
//         DescriptionValidator.shared.validate()
//     }

//     func checkReleases() {
//         ReleaseValidator.shared.validate()
//     }

//     func checkUnitTest() {
//         UnitTestValidator.shared.validate()
//     }

//     func checkTitle() {
//         let result = prTitle.range(
//             of: #"\[[A-zÀ-ú0-9 ]*\][A-zÀ-ú0-9- ]+"#,
//             options: .regularExpression
//         ) != nil

//         if !result {
//             let message = "O título do PR dever ser assim: [<i>Funcionalidade ou Flow</i>] <i>Qual o fluxo que foi feito</i>"
//             warn(message)
//         }
//     }

//     func checkAssignee() {
//         if danger.github.pullRequest.assignee == nil {
//             warn("Por gentileza, atribuir a você o PR.")
//         }
//     }

//     func checkModifiedFiles() {
//         if changedFiles > ValidationRules.maxChangedFiles {
//             let message = 
//             """
//             PR contém muitos arquivos alterados. Se possível, nas próximas vezes tente dividir em features menores.
//             """
//             warn(message)
//         }
//     }

//     func checkFails() {
//         if !danger.fails.isEmpty {
//             _ = danger.utils.exec("touch Danger-has-fails.swift")
//         }
//     }

//     func logResume() {
//         let overview = 
//         """
//         O PR adicionou \(additions) e removeu \(deletions) linhas. \(changedFiles) arquivo(s) alterado(s).
//         """

//         let seeOurDocumentation = 
//         """
//         Veja nossa documentação atualizada: <br/> \
//         <a href='https://github.pactual.net/Digital/digital-ios/wiki/Pull-Request'> \
//         Padrão, exemplo e boas práticas de Pull-Request</a>
//         """

//         message(seeOurDocumentation)
//         message(overview)
//     }
// }

// // MARK: Constants

// private enum ValidationRules {
//     static let maxChangedFiles = 20
//     static let bigPRThreshold = 3000
// }

// // MARK: Extensions

// fileprivate extension Danger.File {
//     var isInSources: Bool { hasPrefix("Sources/") }
//     var isInTests: Bool { hasPrefix("Tests/") }

//     var isSourceFile: Bool {
//         hasSuffix(".swift") || hasSuffix(".h") || hasSuffix(".m")
//     }

//     var isSwiftPackageDefintion: Bool {
//         hasPrefix("Package") && hasSuffix(".swift")
//     }

//     var isDangerfile: Bool {
//         self == "Dangerfile.swift"
//     }
// }

// // MARK: ReleaseValidator Methods

// fileprivate extension ReleaseValidator {

//     func checkReleaseVersion() {
//         let message = 
//         """
//         Encontrado uma release em andamento ou publicada para essa versão. <br/> \
//         Por favor, atualize a versão no <b>.podspec</b> do modulo.
//         """

//         let file = "Danger-release-version-error.swift"
//         if FileManager.default.fileExists(atPath: file) {
//             fail(message)
//         }
//     }
// }

// // MARK: UnitTestValidator Methods

// fileprivate extension UnitTestValidator {

//     func checkUnitTestSummary() {
//         let file = "build/reports/errors.json"
//         if FileManager.default.fileExists(atPath: file) {
//             let summary = XCodeSummary(filePath: file) { result in
//                 result.category != .warning
//             }
//             summary.report()
//         }
//     }

//     func checkUnitTestCoverage() {
//         let folder = "temp/derived"
//         if FileManager.default.fileExists(atPath: "\(folder)/info.plist") {
//             Coverage.xcodeBuildCoverage(.derivedDataFolder(folder), minimumCoverage: 70)
//         }
//     }
// }
