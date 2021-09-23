//
//  PDFCreator.swift
//  AppEscolarFI
//
//  Created by Fernanda Hernandez on 22/08/21.
//

import UIKit
import PDFKit

class PDFCreator: NSObject {
    
    let title: String = "FACULTAD DE INGENIERÍA \nSECRETARIA DE SERVICIOS ACADÉMICOS \nCOORDINACIÓN DE ADMINISTRACIÓN ESCOLAR \nÁREA DE SERVICIOS ESCOLARES "
    let documentName: String
    let image: UIImage = UIImage(imageLiteralResourceName: "LOGO-UNAM.png")
    let studentInformation: String
    let tableTitle: String

    init( documentName: String, studentInformation: String,tableTitle: String ) {
      
        self.documentName = documentName
        
        self.studentInformation = studentInformation
        self.tableTitle = tableTitle
    }
    
    func createConstancy(array: [SchoolSubject]) -> Data {
      // 1
        
      let pdfMetaData = [
        kCGPDFContextCreator: "Coordinación de administración escolar",
        kCGPDFContextAuthor: "cae",
        kCGPDFContextTitle: title
      ]
      let format = UIGraphicsPDFRendererFormat()
      format.documentInfo = pdfMetaData as [String: Any]
        var i: Int = 0
        var rowselected: String?
    
      let pageWidth = 8.5 * 72.0
      let pageHeight = 11 * 72.0
      let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
      let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
      let data = renderer.pdfData { (context) in

        context.beginPage()

        let titleBottom = addTitle(pageRect: pageRect)
        
        addImage(pageRect: pageRect)
        addSello(pageRect: pageRect)
        addBodyText(pageRect: pageRect, textTop: titleBottom + 15)
        addDataFromTheStudentText(pageRect: pageRect, textTop: CGFloat(160))
        let context = context.cgContext
        
        drawTable(context, pageRect: pageRect, tearOffY: CGFloat(265),
                     numberTabs: array.count)
        
        for schoolsubject in array{
            rowselected = "\(schoolsubject.key)          \(schoolsubject.name)"
            addOneRowWithoutGroup(pageRect: pageRect, textTop: CGFloat(160), row: rowselected! ,place: i)
            addGroup(pageRect: pageRect, textTop: CGFloat(160), group:  schoolsubject.group,place: i)
            i+=1
            
        }
        addFooter(pageRect: pageRect)
      }

      return data
    }
    
    func addTitle(pageRect: CGRect) -> CGFloat {
      
      let titleFont = UIFont.systemFont(ofSize: 14.0, weight: .bold)
      let titleAttributes: [NSAttributedString.Key: Any] =
        [NSAttributedString.Key.font: titleFont]
      let attributedTitle = NSAttributedString(
        string: title,
        attributes: titleAttributes
      )
      let titleStringSize = attributedTitle.size()
      let titleStringRect = CGRect(
        x: (pageRect.width - titleStringSize.width) / 1.5,
        y: 36,
        width: titleStringSize.width,
        height: titleStringSize.height
      )
      attributedTitle.draw(in: titleStringRect)
      return titleStringRect.origin.y + titleStringRect.size.height
    }
    
    func addBodyText(pageRect: CGRect, textTop: CGFloat) {
      let textFont = UIFont.systemFont(ofSize: 11.0, weight: .bold)
        let AttributesOnlyForTheX: [NSAttributedString.Key: Any] =
          [NSAttributedString.Key.font: textFont]
        let attributedOnlyForTheX = NSAttributedString(
          string: documentName,
          attributes: AttributesOnlyForTheX
        )
        
        let titleStringSize = attributedOnlyForTheX.size()
     
      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.alignment = .natural
      paragraphStyle.lineBreakMode = .byWordWrapping
    
      let textAttributes = [
        NSAttributedString.Key.paragraphStyle: paragraphStyle,
        NSAttributedString.Key.font: textFont
      ]
      let attributedText = NSAttributedString(
        string: documentName,
        attributes: textAttributes
      )
      
      let textRect = CGRect(
        x: (pageRect.width - titleStringSize.width) / 2,
        y: textTop,
        width: pageRect.width - 20,
        height: pageRect.height - textTop - pageRect.height / 5.0
      )
      attributedText.draw(in: textRect)
    }
    
    func addSello(pageRect: CGRect) {
      
      let escudo = UIImage(imageLiteralResourceName: "Escudo.png")
        let imageRect = CGRect(x: CGFloat(450), y: CGFloat(480),width: CGFloat(110), height: CGFloat(110))
        escudo.draw(in: imageRect)
    }
    func addImage(pageRect: CGRect) {
      
      let imageRect = CGRect(x: CGFloat(15), y: CGFloat(15),width: CGFloat(120), height: CGFloat(120))
      image.draw(in: imageRect)
    }
    
    func drawTable(_ drawContext: CGContext, pageRect: CGRect,
                      tearOffY: CGFloat, numberTabs: Int) {
        let textFont = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        // 1
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .natural
        paragraphStyle.lineBreakMode = .byWordWrapping
        // 2
        let textAttributes = [
          NSAttributedString.Key.paragraphStyle: paragraphStyle,
          NSAttributedString.Key.font: textFont
        ]
        let attributedText = NSAttributedString(
          string: tableTitle,
          attributes: textAttributes
        )
        // 3
        let textRect = CGRect(
          x: 30,
          y: 270,
          width: pageRect.width - 20,
          height: pageRect.height - 260 - pageRect.height / 5.0
            
        )
        attributedText.draw(in: textRect)
      drawContext.saveGState()
      drawContext.setLineWidth(1.0)

      drawContext.move(to: CGPoint(x: 30, y: tearOffY))
      drawContext.addLine(to: CGPoint(x: pageRect.width - 60, y: tearOffY))
      drawContext.strokePath()
      drawContext.restoreGState()

      drawContext.saveGState()

      for tearOffIndex in 1..<(numberTabs + 2) {
        let tabY = CGFloat((tearOffIndex * 30) + 260)
        
        drawContext.move(to: CGPoint(x: 30, y: tabY))
        drawContext.addLine(to: CGPoint(x: pageRect.width - 60, y: tabY))
        drawContext.strokePath()
      }

      drawContext.restoreGState()
      
        drawContext.saveGState()
        let sizeOfTable = tearOffY + CGFloat(30 * (numberTabs + 1))
        drawContext.move(to: CGPoint(x: 30, y: sizeOfTable - 5))
        drawContext.addLine(to: CGPoint(x: 30, y: tearOffY ))
        drawContext.strokePath()
        drawContext.restoreGState()
        
        drawContext.saveGState()
        drawContext.move(to: CGPoint(x: pageRect.width - 60, y: sizeOfTable - 5))
        drawContext.addLine(to: CGPoint(x: pageRect.width - 60, y: tearOffY))
        drawContext.strokePath()
        drawContext.restoreGState()
        
        drawContext.saveGState()
        drawContext.setLineWidth(1.0)

        drawContext.move(to: CGPoint(x: 100, y: sizeOfTable - 5))
        drawContext.addLine(to: CGPoint(x: 100, y: tearOffY))
        drawContext.strokePath()
        drawContext.restoreGState()
        
        drawContext.saveGState()
        drawContext.setLineWidth(1.0)

        drawContext.move(to: CGPoint(x: 480, y: sizeOfTable - 5))
        drawContext.addLine(to: CGPoint(x: 480, y: tearOffY))
        drawContext.strokePath()
        drawContext.restoreGState()
    }
    
    func addDataFromTheStudentText(pageRect: CGRect, textTop: CGFloat) {
      let textFont = UIFont.systemFont(ofSize: 14.0, weight: .regular)
      // 1
      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.alignment = .natural
      paragraphStyle.lineBreakMode = .byWordWrapping
      // 2
      let textAttributes = [
        NSAttributedString.Key.paragraphStyle: paragraphStyle,
        NSAttributedString.Key.font: textFont
      ]
      let attributedText = NSAttributedString(
        string: studentInformation,
        attributes: textAttributes
      )
      // 3
      let textRect = CGRect(
        x: 30,
        y: textTop,
        width: pageRect.width - 20,
        height: pageRect.height - textTop - pageRect.height / 5.0
      )
      attributedText.draw(in: textRect)
    }
    
    func addOneRowWithoutGroup(pageRect: CGRect, textTop: CGFloat, row: String, place: Int) {
      let textFont = UIFont.systemFont(ofSize: 14.0, weight: .regular)

      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.alignment = .natural
      paragraphStyle.lineBreakMode = .byWordWrapping

      let textAttributes = [
        NSAttributedString.Key.paragraphStyle: paragraphStyle,
        NSAttributedString.Key.font: textFont
      ]
      let attributedText = NSAttributedString(
        string: row,
        attributes: textAttributes
      )
        
      let textRect = CGRect(
        x: 38 ,
        y: 298 + (CGFloat(place) * 28),
        width: pageRect.width - 20,
        height: pageRect.height - textTop - pageRect.height / 5.0
      )
      attributedText.draw(in: textRect)
    }
    func addGroup(pageRect: CGRect, textTop: CGFloat, group: String, place: Int) {
      let textFont = UIFont.systemFont(ofSize: 14.0, weight: .regular)

      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.alignment = .natural
      paragraphStyle.lineBreakMode = .byWordWrapping

      let textAttributes = [
        NSAttributedString.Key.paragraphStyle: paragraphStyle,
        NSAttributedString.Key.font: textFont
      ]
      let attributedText = NSAttributedString(
        string: group,
        attributes: textAttributes
      )
        
      let textRect = CGRect(
        x: 486 ,
        y: 298 + (CGFloat(place) * 28),
        width: pageRect.width - 20,
        height: pageRect.height - textTop - pageRect.height / 5.0
      )
      attributedText.draw(in: textRect)
    }
    func addFooter(pageRect: CGRect) {
        let fecha = Date().description(with: .current)
      let textFont = UIFont.systemFont(ofSize: 14.0, weight: .regular)

      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.alignment = .natural
      paragraphStyle.lineBreakMode = .byWordWrapping

      let textAttributes = [
        NSAttributedString.Key.paragraphStyle: paragraphStyle,
        NSAttributedString.Key.font: textFont
      ]
      let attributedText = NSAttributedString(
        string: "Universidad Latioamericana Unida, Torreón Coahuila, to \(fecha)\n\nTel. 55 4562345 Fax 55 4564356.\nCalzada de las brujas, edificio AM, Universidad Latioamericana Unida, Torreón Coahuila",
        attributes: textAttributes
      )
        
      let textRect = CGRect(
        x: 30 ,
        y: 630,
        width: pageRect.width - 90,
        height: CGFloat(265)
      )
      attributedText.draw(in: textRect)
    }
    
    func createConstancySemester() -> Data {
      // 1
        
      let pdfMetaData = [
        kCGPDFContextCreator: "Coordinación de administración escolar",
        kCGPDFContextAuthor: "cae",
        kCGPDFContextTitle: title
      ]
      let format = UIGraphicsPDFRendererFormat()
      format.documentInfo = pdfMetaData as [String: Any]
    
      let pageWidth = 8.5 * 72.0
      let pageHeight = 11 * 72.0
      let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
      let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
      let data = renderer.pdfData { (context) in

        context.beginPage()

        let titleBottom = addTitle(pageRect: pageRect)
        
        addImage(pageRect: pageRect)
        addSello(pageRect: pageRect)
        addBodyText(pageRect: pageRect, textTop: titleBottom + 15)
        addDataFromTheStudentText(pageRect: pageRect, textTop: CGFloat(160))
        
       
        addFooter(pageRect: pageRect)
      }

      return data
    }
    
    
}
